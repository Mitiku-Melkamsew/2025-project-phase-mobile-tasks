import '../repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Future<void> call(int id) async {
    return await repository.deleteProduct(id);
  }
}