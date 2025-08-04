import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/product.dart';
import '../models/product_data_model.dart';

abstract class ProductRemoteDataSource {
  Future<void> insertProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(int id);
  Future<ProductModel> getProduct(int id);
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl(this.client);

 @override
  Future<void> insertProduct(Product product) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
    );

    request.fields['name'] = product.name;
    request.fields['description'] = product.description;
    request.fields['price'] = product.price.toString();
    request.files.add(await http.MultipartFile.fromPath('image', product.imageUrl));

    final response = await client.send(request);

    if (response.statusCode != 201) { 
      throw ServerException();
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    final request = http.MultipartRequest(
      'PUT', 
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${product.id}'),
    );
    request.fields['name'] = product.name;
    request.fields['description'] = product.description;
    request.fields['price'] = product.price.toString();
    if (product.imageUrl.startsWith('/')) {
        request.files.add(await http.MultipartFile.fromPath('image', product.imageUrl));
    }

    final response = await client.send(request);

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProduct(int id) async {
    final response = await client.delete(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id'),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }
  @override
  Future<ProductModel> getProduct(int id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts() async{
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/'),
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
