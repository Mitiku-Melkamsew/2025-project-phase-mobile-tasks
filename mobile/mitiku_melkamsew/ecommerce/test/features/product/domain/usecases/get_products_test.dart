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
    id: '1',
    name: 'Wall-E',
    description: 'A robot that collects human garbage.',
    imageUrl: 'robot.jpg',
    price: 49.99,
  )
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
