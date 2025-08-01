import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/product/domain/usecases/delete_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late DeleteProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = DeleteProduct(mockProductRepository);
  });

  const tProductId = 1;

  test(
    'should call deleteProduct on the repository with the correct id',
    () async {
      // Arrange
      when(mockProductRepository.deleteProduct(any))
          .thenAnswer((_) async => Future.value());

      // Act
      await usecase(tProductId);

      // Assert
      verify(mockProductRepository.deleteProduct(tProductId));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );
}