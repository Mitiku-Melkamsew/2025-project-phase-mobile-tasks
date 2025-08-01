import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);
  Future<Either<Failure, List<Product>>> getproducts (){
    return repository.getProducts();
  }
}