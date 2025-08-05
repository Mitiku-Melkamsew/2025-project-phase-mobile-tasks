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

  final tId = '1';
  final tProductModel = const ProductModel(
    id: '1',
    name: 'Wall-E',
    description: 'A robot that collects human garbage.',
    imageUrl: 'robot.jpg',
    price: 49.99,
  );
  final Product tProduct = tProductModel;
  final tProductModelList = [tProductModel];
  final List<Product> tProductList = tProductModelList;

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
    runTestsOnline(() {
      test(
        'should call the remote data source when device is online',
        () async {
          // Arrange
          when(
            mockProductRemoteDataSource.deleteProduct(tId),
          ).thenAnswer((_) async => Future.value());
          // Act
          await repository.deleteProduct(tId);
          // Assert
          verify(mockProductRemoteDataSource.deleteProduct(tId));
          verifyNoMoreInteractions(mockProductRemoteDataSource);
        },
      );

      test('should return ServerFailure when remote call fails', () async {
        // Arrange
        when(
          mockProductRemoteDataSource.deleteProduct(tId),
        ).thenThrow(ServerException());
        // Act
        final result = await repository.deleteProduct(tId);
        // Assert
        expect(result, Left(ServerFailure()));
      });
    });

    runTestsOffline(() {
      test('should return ServerFailure when device is offline', () async {
        // Act
        final result = await repository.deleteProduct(tId);
        // Assert
        expect(result, Left(ServerFailure()));
        verifyZeroInteractions(mockProductRemoteDataSource);
      });
    });
  });

  group('insertProduct', () {
    runTestsOnline(() {
      test(
        'should call the remote data source when device is online',
        () async {
          // Arrange
          when(
            mockProductRemoteDataSource.insertProduct(tProduct),
          ).thenAnswer((_) async => tProduct);
          // Act
          await repository.insertProduct(tProduct);
          // Assert
          verify(mockProductRemoteDataSource.insertProduct(tProduct));
          verifyNoMoreInteractions(mockProductRemoteDataSource);
        },
      );

      test('should return ServerFailure when remote call fails', () async {
        // Arrange
        when(
          mockProductRemoteDataSource.insertProduct(tProduct),
        ).thenThrow(ServerException());
        // Act
        final result = await repository.insertProduct(tProduct);
        // Assert
        expect(result, Left(ServerFailure()));
      });
    });

    runTestsOffline(() {
      test('should return ServerFailure when device is offline', () async {
        // Act
        final result = await repository.insertProduct(tProduct);
        // Assert
        expect(result, Left(ServerFailure()));
        verifyZeroInteractions(mockProductRemoteDataSource);
      });
    });
  });

  group('updateProduct', () {
    runTestsOnline(() {
      test(
        'should call the remote data source when device is online',
        () async {
          // Arrange
          when(
            mockProductRemoteDataSource.updateProduct(tProduct),
          ).thenAnswer((_) async => tProduct);
          // Act
          await repository.updateProduct(tProduct);
          // Assert
          verify(mockProductRemoteDataSource.updateProduct(tProduct));
          verifyNoMoreInteractions(mockProductRemoteDataSource);
        },
      );

      test('should return ServerFailure when remote call fails', () async {
        // Arrange
        when(
          mockProductRemoteDataSource.updateProduct(tProduct),
        ).thenThrow(ServerException());
        // Act
        final result = await repository.updateProduct(tProduct);
        // Assert
        expect(result, Left(ServerFailure()));
      });
    });

    runTestsOffline(() {
      test('should return ServerFailure when device is offline', () async {
        // Act
        final result = await repository.updateProduct(tProduct);
        // Assert
        expect(result, Left(ServerFailure()));
        verifyZeroInteractions(mockProductRemoteDataSource);
      });
    });
  });

  group('getProduct', () {
    test('should check if the device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockProductRemoteDataSource.getProduct(any),
      ).thenAnswer((_) async => tProductModel);
      // Act
      await repository.getProduct(tId);
      // Assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // Arrange
          when(
            mockProductRemoteDataSource.getProduct(tId),
          ).thenAnswer((_) async => tProductModel);
          // Act
          final result = await repository.getProduct(tId);
          // Assert
          verify(mockProductRemoteDataSource.getProduct(tId));
          expect(result, equals(Right(tProduct)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // Arrange
          when(
            mockProductRemoteDataSource.getProduct(tId),
          ).thenThrow(ServerException());
          // Act
          final result = await repository.getProduct(tId);
          // Assert
          verify(mockProductRemoteDataSource.getProduct(tId));
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
            mockProductLocalDataSource.getProduct(tId),
          ).thenAnswer((_) async => tProductModel);
          // Act
          final result = await repository.getProduct(tId);
          // Assert
          verifyZeroInteractions(mockProductRemoteDataSource);
          verify(mockProductLocalDataSource.getProduct(tId));
          expect(result, equals(Right(tProduct)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // Arrange
          when(
            mockProductLocalDataSource.getProduct(tId),
          ).thenThrow(CacheException());
          // Act
          final result = await repository.getProduct(tId);
          // Assert
          verifyZeroInteractions(mockProductRemoteDataSource);
          verify(mockProductLocalDataSource.getProduct(tId));
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });

  group('getProducts', () {
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
