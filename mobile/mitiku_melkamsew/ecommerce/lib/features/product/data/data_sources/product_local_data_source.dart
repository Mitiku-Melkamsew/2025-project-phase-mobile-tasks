import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/product_data_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getLastProducts();
  Future<void> cacheProducts(List<ProductModel> productsToCache);
  Future<void> deleteProduct(String id);
  Future<ProductModel> getProduct(String id);
}

// ignore: constant_identifier_names
const CACHED_PRODUCTS = 'CACHED_PRODUCTS';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferencesAsync sharedPreferences;

  ProductLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheProducts(List<ProductModel> productsToCache) async {
    final jsonList = productsToCache
        .map((product) => product.toJson())
        .toList();
    await sharedPreferences.setString(CACHED_PRODUCTS, json.encode(jsonList));
  }

  @override
  Future<List<ProductModel>> getLastProducts() async {
    final jsonString = await sharedPreferences.getString(CACHED_PRODUCTS);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      final products = jsonList
          .map((json) => ProductModel.fromJson(json))
          .toList();
      return products;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    final jsonString = await sharedPreferences.getString(CACHED_PRODUCTS);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      final products = jsonList
          .map((json) => ProductModel.fromJson(json))
          .toList();
      products.removeWhere((product) => product.id == id);
      final updatedJsonList = products
          .map((product) => product.toJson())
          .toList();
      await sharedPreferences.setString(
        CACHED_PRODUCTS,
        json.encode(updatedJsonList),
      );
    }else{
      throw CacheException();
    }
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    final jsonString = await sharedPreferences.getString(CACHED_PRODUCTS);
    if (jsonString != null) {
      final jsonList = jsonDecode(jsonString);
      final productList = jsonList
          .map((e) => ProductModel.fromJson(e))
          .toList();
      return (productList.firstWhere(
        (e) => e.id == id,
        orElse: () => throw CacheException(),
      ));
    }else{
      throw CacheException();
    }
  }
}
