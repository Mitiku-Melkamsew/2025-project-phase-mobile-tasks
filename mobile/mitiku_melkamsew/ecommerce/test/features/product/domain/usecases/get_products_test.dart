import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mocks.mocks.dart';

void main() {
  late MockProductRepository mockProductRepository;
  setUp(() {
    mockProductRepository = MockProductRepository();
  });
  final List<Product> tProductList = const [
    Product(
      id: 1,
      name: 'Test Product',
      description: 'Test Description',
      imageUrl: 'test.jpg',
      price: 99.99,
      category: 'Test Category',
    ),
  ];
  test('Should call getproducts in product repository', () async {
    when(
      mockProductRepository.getProducts(),
    ).thenAnswer((_) async => Right(tProductList));

    final result = await mockProductRepository.getProducts();

    expect(result, Right(tProductList));
    verify(mockProductRepository.getProducts());
    verifyNoMoreInteractions(mockProductRepository);
  });
}
