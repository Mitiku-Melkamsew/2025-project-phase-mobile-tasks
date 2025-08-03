import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/features/product/data/data_sources/product_local_data_source.dart';
import 'package:ecommerce/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  ProductRepository,
  ProductLocalDataSource,
  ProductRemoteDataSource,
  NetworkInfo,
  InternetConnectionChecker,
])
void main() {}