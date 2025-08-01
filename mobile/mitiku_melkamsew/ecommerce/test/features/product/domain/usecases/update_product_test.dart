import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/product/domain/usecases/update_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late UpdateProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = UpdateProduct(mockProductRepository);
  });

  final tProductToUpdate = const Product(
    id: 1,
    name: 'Updated Product',
    description: 'Updated Description',
    imageUrl: 'updated.jpg',
    price: 29.99,
    category: 'Robot'
  );

  test('should call updateProduct on the repository with the correct product', () async {
    // Arrange
    when(mockProductRepository.updateProduct(any))
        .thenAnswer((_) async => Future.value());

    // Act
    await usecase(tProductToUpdate);

    // Assert
    verify(mockProductRepository.updateProduct(tProductToUpdate));
    verifyNoMoreInteractions(mockProductRepository);
  });
}