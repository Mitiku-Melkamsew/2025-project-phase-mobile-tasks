import '../../domain/entities/product.dart';
import '../models/product_data_model.dart';

abstract class ProductRemoteDataSource {
  Future<void> insertProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(int id);
  /// Throws [ServerException]
  Future<ProductModel> getProduct(int id);

}