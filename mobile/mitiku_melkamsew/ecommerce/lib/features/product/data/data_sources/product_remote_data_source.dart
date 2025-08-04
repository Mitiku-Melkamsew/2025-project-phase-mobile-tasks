import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/product.dart';
import '../models/product_data_model.dart';

abstract class ProductRemoteDataSource {
  Future<void> insertProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
  Future<ProductModel> getProduct(String id);
  Future<List<ProductModel>> getProducts();
}

const baseUrl =
    'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl(this.client);

  @override
  Future<void> insertProduct(Product product) async {
    final request = http.MultipartRequest('POST', Uri.parse(baseUrl));

    request.fields['name'] = product.name;
    request.fields['description'] = product.description;
    request.fields['price'] = product.price.toString();
    request.files.add(
      await http.MultipartFile.fromPath('image', product.imageUrl),
    );

    final response = await client.send(request);

    if (response.statusCode != 201) {
      throw ServerException();
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    final Map<String, dynamic> bodyRequest = {
      'name': product.name,
      'description': product.description,
      'price': product.price,
    };
    final response = await client.put(
      Uri.parse('$baseUrl/${product.id}'),
      body: jsonEncode(bodyRequest),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/$id'),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    final jsonString = await http.get(Uri.parse('$baseUrl/$id'));
    if (jsonString.statusCode != 200) {
      final jsonMap = jsonDecode(jsonString.body);
      final product = ProductModel.fromJson(jsonMap);
      return product;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(
      Uri.parse(baseUrl),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
