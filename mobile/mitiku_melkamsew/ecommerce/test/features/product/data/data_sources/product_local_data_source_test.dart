import 'dart:convert';

import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/product/data/data_sources/product_local_data_source.dart';
import 'package:ecommerce/features/product/data/models/product_data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/fixtures/fixture_reader.dart';
import '../../../../helper/mocks.mocks.dart';

void main() {
  late ProductLocalDataSourceImpl dataSource;
  late MockSharedPreferencesAsync mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferencesAsync();
    dataSource = ProductLocalDataSourceImpl(mockSharedPreferences);
  });

  final tProductModelList = [
    const ProductModel(
      id: '1',
      name: 'Wall-E',
      description: 'A robot that collects human garbage.',
      imageUrl: 'robot.jpg',
      price: 49.99,
    ),
  ];

  group('getLastProducts', () {
    late List<ProductModel> expectedProductList;
    setUp(() {
      final List<dynamic> jsonList = json.decode(fixture('products.json'));
      expectedProductList = jsonList
          .map((json) => ProductModel.fromJson(json))
          .toList();
    });

    test(
      'should return List<ProductModel> from SharedPreferences when there is one in the cache',
      () async {
        when(
          mockSharedPreferences.getString(any),
        ).thenAnswer((_) async => fixture('products.json'));

        final result = await dataSource.getLastProducts();

        verify(mockSharedPreferences.getString(CACHED_PRODUCTS));
        expect(result, equals(expectedProductList));
      },
    );

    test('should throw a CacheException when there is no cached value', () {
      when(mockSharedPreferences.getString(any)).thenAnswer((_) async => null);
      final call = dataSource.getLastProducts;

      expect(() => call(), throwsA(isA<CacheException>()));
    });
  });

  group('cacheProducts', () {
    test('should call SharedPreferences to cache the data', () async {
      final expectedJsonString = json.encode(
        tProductModelList.map((p) => p.toJson()).toList(),
      );
      when(
        mockSharedPreferences.setString(any, any),
      ).thenAnswer((_) async => true);
      await dataSource.cacheProducts(tProductModelList);
      verify(
        mockSharedPreferences.setString(CACHED_PRODUCTS, expectedJsonString),
      );
    });
  });
}
