import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mocks.mocks.dart';

void main() {
  late ProductBloc productBloc;
  late MockDeleteProduct mockDeleteProduct;
  late MockUpdateProduct mockUpdateProduct;
  late MockGetProduct mockGetProduct;
  late MockGetProducts mockGetProducts;
  late MockInsertProduct mockInsertProduct;

  final tProduct = const Product(
    id: '1',
    name: 'Test Product',
    description: 'A cool product',
    imageUrl: 'image.jpg',
    price: 99.99,
  );
  final tProductList = [tProduct];

  setUp(() {
    mockDeleteProduct = MockDeleteProduct();
    mockUpdateProduct = MockUpdateProduct();
    mockGetProducts = MockGetProducts();
    mockGetProduct = MockGetProduct();
    mockInsertProduct = MockInsertProduct();
    productBloc = ProductBloc(
      getProduct: mockGetProduct,
      getProducts: mockGetProducts,
      deleteProduct: mockDeleteProduct,
      updateProduct: mockUpdateProduct,
      insertProduct: mockInsertProduct,
    );
  });

  test('initial state should be InitialState', () {
    expect(productBloc.state, equals(InitialState()));
  });

  group('LoadAllProductsEvent', () {
    blocTest<ProductBloc, ProductState>(
      'should emit [LoadingState, LoadedAllProductState] when data is gotten successfully',
      build: () {
        when(mockGetProducts()).thenAnswer((_) async => Right(tProductList));
        return productBloc;
      },
      act: (bloc) => bloc.add(LoadAllProductsEvent()),
      expect: () => <ProductState>[
        LoadingState(),
        LoadedAllProductState(tProductList),
      ],
      verify: (_) => verify(mockGetProducts()),
    );

    blocTest<ProductBloc, ProductState>(
      'Should emit [loadingstate, errorstate] when there is a failure.',
      build: () {
        when(mockGetProducts()).thenAnswer((_) async => Left(CacheFailure()));
        return productBloc;
      },
      act: (bloc) => bloc.add(LoadAllProductsEvent()),
      expect: () => <ProductState>[
        LoadingState(),
        const ErrorState('Cache Failure'),
      ],
    );
  });
}
