import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/product/domain/usecases/delete_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mocks.mocks.dart';

void main() {
  late DeleteProduct useCase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    useCase = DeleteProduct(mockProductRepository);
  });

  const tProductId = '1';
  test('test name', () {
    // Arrange
      when(
        mockProductRepository.deleteProduct(any),
      ).thenAnswer((_) async => const Right(null));

      // Act
      useCase(tProductId);

      // Assert
      verify(mockProductRepository.deleteProduct(tProductId));
      verifyNoMoreInteractions(mockProductRepository);
  });
  test(
    'should call deleteProduct on the repository with the correct id',
    () async {
      // Arrange
      when(
        mockProductRepository.deleteProduct(any),
      ).thenAnswer((_) async => const Right(null));

      // Act
      await useCase(tProductId);

      // Assert
      verify(mockProductRepository.deleteProduct(tProductId));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );
}
