import 'package:dartz/dartz.dart';
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

  final tProduct = const Product(
    id: '1',
    name: 'Wall-E',
    description: 'A robot that collects human garbage.',
    imageUrl: 'robot.jpg',
    price: 49.99,
  );

  test('should call updateProduct on the repository with the correct product', () async {
    when(mockProductRepository.updateProduct(any))
        .thenAnswer((_) async => const Right(null));

    await usecase(tProduct);

    verify(mockProductRepository.updateProduct(tProduct));
    verifyNoMoreInteractions(mockProductRepository);
  });
}