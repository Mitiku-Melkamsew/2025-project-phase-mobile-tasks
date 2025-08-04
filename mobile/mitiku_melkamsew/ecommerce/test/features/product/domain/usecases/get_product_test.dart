import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/domain/usecases/get_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mocks.mocks.dart';

void main() {
  late GetProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetProduct(mockProductRepository);
  });

  const tProductId = '1';
  final tProduct = const Product(
    id: '1',
    name: 'Wall-E',
    description: 'A robot that collects human garbage.',
    imageUrl: 'robot.jpg',
    price: 49.99,
  );


  test(
    'should get a single product from the repository by id',
    () async {
      // Arrange
      when(mockProductRepository.getProduct(any)).thenAnswer((_) async => Right(tProduct));

      // Act
      final result = await usecase(tProductId);

      // Assert
      expect(result, Right(tProduct));
      verify(mockProductRepository.getProduct(tProductId));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );
}