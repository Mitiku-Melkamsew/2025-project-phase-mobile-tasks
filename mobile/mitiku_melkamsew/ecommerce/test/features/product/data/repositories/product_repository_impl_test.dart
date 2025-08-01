

import 'package:ecommerce/core/platform/network_info.dart';
import 'package:ecommerce/features/product/data/data_sources/product_local_data_source.dart';
import 'package:ecommerce/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../domain/usecases/delete_product_test.mocks.dart';
import 'product_repository_impl_test.mocks.dart';

@GenerateMocks([ProductRemoteDataSource, ProductLocalDataSource, NetworkInfo])
void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late MockProductLocalDataSource mockProductLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  setUp((){
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    mockProductLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockProductRemoteDataSource,
      localDataSource: mockProductLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });
}