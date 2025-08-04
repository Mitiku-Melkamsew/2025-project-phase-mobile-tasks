import 'package:ecommerce/features/product/data/models/product_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tProductModel = ProductModel(
    id: '1',
    name: 'Wall-E',
    description: 'A robot that collects human garbage.',
    imageUrl: 'robot.jpg',
    price: 49.99,
  );

  final tProductJson = const {
    'id': '1',
    'name': 'Wall-E',
    'description': 'A robot that collects human garbage.',
    'imageUrl': 'robot.jpg',
    'price': 49.99,
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
