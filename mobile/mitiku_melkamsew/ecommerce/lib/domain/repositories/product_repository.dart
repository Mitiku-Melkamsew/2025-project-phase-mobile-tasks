import '../entities/product.dart';

abstract class ProductRepository {
  Future<void> insertProduct(Product product);
  Future<void> updateProduct(int id);
  Future<void> deleteProduct(int id);
  Future<Product> getProduct(int id);
}