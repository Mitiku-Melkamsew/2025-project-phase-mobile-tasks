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
    id: 0,
    name: 'New Product',
    description: 'A brand new product.',
    imageUrl: 'new.jpg',
    price: 49.99,
    category: 'Gadget'
  );

  test(
    'should call insertProduct on the repository with the correct product',
    () async {
      // Arrange
      when(mockProductRepository.insertProduct(any))
          .thenAnswer((_) async => Future.value());

      // Act
      await usecase(tProduct);

      // Assert
      verify(mockProductRepository.insertProduct(tProduct));
      verifyNoMoreInteractions(mockProductRepository);
    },
  );
}