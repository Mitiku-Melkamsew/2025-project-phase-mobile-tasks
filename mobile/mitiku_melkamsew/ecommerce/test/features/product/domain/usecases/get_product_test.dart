import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/product/domain/usecases/get_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late GetProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetProduct(mockProductRepository);
  });

  const tProductId = 1;
  final tProduct = const Product(
    id: tProductId,
    name: 'Test Product',
    description: 'Test Description',
    imageUrl: 'test.jpg',
    price: 99.99,
    category: 'Test Category'
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