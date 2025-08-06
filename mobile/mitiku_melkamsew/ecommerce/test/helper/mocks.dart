import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/features/product/data/data_sources/product_local_data_source.dart';
import 'package:ecommerce/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/product/domain/usecases/delete_product.dart';
import 'package:ecommerce/features/product/domain/usecases/get_product.dart';
import 'package:ecommerce/features/product/domain/usecases/get_products.dart';
import 'package:ecommerce/features/product/domain/usecases/insert_product.dart';
import 'package:ecommerce/features/product/domain/usecases/update_product.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
@GenerateMocks([
  ProductRepository,
  ProductLocalDataSource,
  ProductRemoteDataSource,
  NetworkInfo,
  InternetConnectionChecker,
  SharedPreferencesAsync,
  http.Client,
  GetProducts,
  GetProduct,
  UpdateProduct,
  DeleteProduct,
  InsertProduct,
])
void main() {}
