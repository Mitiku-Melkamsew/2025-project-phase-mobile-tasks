import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/product/data/models/product_data_model.dart';
import 'package:ecommerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mocks.mocks.dart';

void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late MockProductLocalDataSource mockProductLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    mockProductLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockProductRemoteDataSource,
      localDataSource: mockProductLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('deleteProduct', () {
    final tId = '1';
    test('should call the remote data source when device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockProductRemoteDataSource.deleteProduct(tId),
      ).thenAnswer((_) async => Future.value());

      // Act
      await repository.deleteProduct(tId);

      // Assert
      verify(mockProductRemoteDataSource.deleteProduct(tId));
      verifyNoMoreInteractions(mockProductRemoteDataSource);
    });

    test('should throw ServerFailure when remote call fails', () async {
      
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockProductRemoteDataSource.deleteProduct(tId),
      ).thenThrow(ServerException());

      final result = await repository.deleteProduct(tId);

      expect(result, Left(ServerFailure()));
    });
  });
  group('insertProduct', () {
    final tProduct = const Product(
      id: '1',
      name: 'Wall-E',
      description: 'A robot that collects human garbage.',
      imageUrl: 'robot.jpg',
      price: 49.99,
    );
    test('should call the remote data source when device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockProductRemoteDataSource.insertProduct(tProduct),
      ).thenAnswer((_) async => tProduct);

      // Act
      await repository.insertProduct(tProduct);

      // Assert
      verify(mockProductRemoteDataSource.insertProduct(tProduct));
      verifyNoMoreInteractions(mockProductRemoteDataSource);
    });

    test('should throw ServerFailure when remote call fails', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockProductRemoteDataSource.insertProduct(tProduct),
      ).thenThrow(ServerException());

      // Act
      final result = await repository.insertProduct(tProduct);

      // Assert
      expect(result, Left(ServerFailure()));
    });
  });
  group('updateProduct', () {
    final tProduct = const Product(
      id: '1',
      name: 'Wall-E',
      description: 'A robot that collects human garbage.',
      imageUrl: 'robot.jpg',
      price: 49.99,
    );

    test('should call the remote data source when device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockProductRemoteDataSource.updateProduct(tProduct),
      ).thenAnswer((_) async => tProduct);

      // Act
      await repository.updateProduct(tProduct);

      // Assert
      verify(mockProductRemoteDataSource.updateProduct(tProduct));
      verifyNoMoreInteractions(mockProductRemoteDataSource);
    });

    test('should return ServerFailure when remote call fails', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockProductRemoteDataSource.updateProduct(tProduct),
      ).thenThrow(ServerException());

      // Act
      final result = await repository.updateProduct(tProduct);

      // Assert
      expect(result, Left(ServerFailure()));
    });
  });
  group('getProducts', () {
    final tProductModelList = [
      const ProductModel(
        id: '1',
        name: 'Wall-E',
        description: 'A robot that collects human garbage.',
        imageUrl: 'robot.jpg',
        price: 49.99,
      ),
    ];
    final List<Product> tProductList = tProductModelList;

    test('should check if the device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockProductRemoteDataSource.getProducts(),
      ).thenAnswer((_) async => tProductModelList);
      // Act
      await repository.getProducts();
      // Assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // Arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(true));
          when(
            mockProductRemoteDataSource.getProducts(),
          ).thenAnswer((_) async => tProductModelList);
          // Act
          final result = await repository.getProducts();
          // Assert
          verify(mockProductRemoteDataSource.getProducts());
          expect(result, equals(Right(tProductList)));
        },
      );

      test(
        'should cache the data locally when the call to remote is successful',
        () async {
          // Arrange
          when(
            mockProductRemoteDataSource.getProducts(),
          ).thenAnswer((_) async => tProductModelList);
          // Act
          await repository.getProducts();
          // Assert
          verify(mockProductRemoteDataSource.getProducts());
          verify(mockProductLocalDataSource.cacheProducts(tProductModelList));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // Arrange
          when(
            mockProductRemoteDataSource.getProducts(),
          ).thenThrow(ServerException());
          // Act
          final result = await repository.getProducts();
          // Assert
          verify(mockProductRemoteDataSource.getProducts());
          verifyZeroInteractions(mockProductLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // Arrange
          when(
            mockProductLocalDataSource.getLastProducts(),
          ).thenAnswer((_) async => tProductModelList);
          // Act
          final result = await repository.getProducts();
          // Assert
          verifyZeroInteractions(mockProductRemoteDataSource);
          verify(mockProductLocalDataSource.getLastProducts());
          expect(result, equals(Right(tProductList)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // Arrange
          when(
            mockProductLocalDataSource.getLastProducts(),
          ).thenThrow(CacheException());
          // Act
          final result = await repository.getProducts();
          // Assert
          verifyZeroInteractions(mockProductRemoteDataSource);
          verify(mockProductLocalDataSource.getLastProducts());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
