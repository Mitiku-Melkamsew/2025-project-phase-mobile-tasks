import 'package:ecommerce/features/product/data/models/product_data_model.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  const tProductModel = ProductModel(
    id: 1,
    name: 'HP Victus 15',
    description: 'Personal computer',
    imageUrl:
        'https://www.omen.com/content/dam/sites/omen/worldwide/laptops/2022-victus-15-intel/Hero%20Image%203.png',
    price: 123.45,
    category: 'abst',
  );

  final tProductJson = {
    'id': 1,
    'name': 'HP Victus 15',
    'description': 'Personal computer',
    'imageUrl': 'https://www.omen.com/content/dam/sites/omen/worldwide/laptops/2022-victus-15-intel/Hero%20Image%203.png',
    'price': 123.45,
    'category': 'abst'
  };

  test('toJson should convert ProductModel to JSON', () async {
    final result = tProductModel.toJson();

    final expectedJson = tProductJson;

    expect(result, expectedJson);
  });

  test('fromJson should convert JSON to ProductModel', () async {
    final result = ProductModel.fromJson(tProductJson);

    expect(result, tProductModel);
  });
}