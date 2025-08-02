import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/domain/usecases/update_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mocks.mocks.dart';

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
    when(mockProductRepository.updateProduct(any))
        .thenAnswer((_) async => Future.value());

    await usecase(tProductToUpdate);

    verify(mockProductRepository.updateProduct(tProductToUpdate));
    verifyNoMoreInteractions(mockProductRepository);
  });
}