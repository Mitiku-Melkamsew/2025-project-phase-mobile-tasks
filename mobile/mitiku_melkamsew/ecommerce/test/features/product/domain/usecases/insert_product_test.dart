import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/domain/usecases/insert_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mocks.mocks.dart';


void main() {
  late InsertProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = InsertProduct(mockProductRepository);
  });

  final tProduct = const Product(
    id: '1',
    name: 'Wall-E',
    description: 'A robot that collects human garbage.',
    imageUrl: 'robot.jpg',
    price: 49.99,
  );

  test(
    'should call insertProduct on the repository with the correct product',
    () async {
      // Arrange
      when(mockProductRepository.insertProduct(any))
          .thenAnswer((_) async => const Right(null));

      // Act
      await usecase(tProduct);

      // Assert
      verify(mockProductRepository.insertProduct(tProduct));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );
}