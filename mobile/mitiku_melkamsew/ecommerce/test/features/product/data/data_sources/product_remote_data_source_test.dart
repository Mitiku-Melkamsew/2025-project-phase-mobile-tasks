import 'dart:convert';

import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce/features/product/data/models/product_data_model.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:path/path.dart' as p;

import '../../../../helper/fixtures/fixture_reader.dart';
import '../../../../helper/mocks.mocks.dart';

void main() {
  late MockClient mockClient;
  late ProductRemoteDataSourceImpl remoteDataSource;
  const String baseUrl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';

  setUp(() {
    mockClient = MockClient();
    remoteDataSource = ProductRemoteDataSourceImpl(mockClient);
  });

  final tProduct = const Product(
    id: '1',
    name: 'Wall-E',
    description: 'A robot that collects human garbage.',
    imageUrl:
        r'C:\Users\Mitiku Melkamsew\Documents\A2SV\Mobile\2025-project-phase-mobile-tasks\mobile\mitiku_melkamsew\ecommerce\assets\phone.jpg',
    price: 49.99,
  );
  group('get products', () {
    test('Should send a correct request with header for the client', () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) => Future.value(http.Response(fixture('products.json'), 200)),
      );
      await remoteDataSource.getProducts();

      verify(
        mockClient.get(
          Uri.parse(
            baseUrl,
          ),
          headers: {'content-type': 'application/json'},
        ),
      );
    });

    test('Should return productModel when the status code is 200', () async {
      final List<dynamic> jsonList = (json.decode(
        fixture('products.json'),
      )).toList();
      final List<Product> prductList = jsonList
          .map((e) => ProductModel.fromJson(e))
          .toList();

      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) => Future.value(http.Response(fixture('products.json'), 200)),
      );
      final result = await remoteDataSource.getProducts();

      expect(result, prductList);
    });
    test(
      'Should throw serverException error if the response is not 200',
      () async {
        when(
          mockClient.get(any, headers: anyNamed('headers')),
        ).thenAnswer((_) async => http.Response('', 404));

        final call = remoteDataSource.getProducts();
        expect(call, throwsA(isA<ServerException>()));
      },
    );
  });
  group('insertProduct (POST multipart/form-data)', () {
    test(
      'should perform a POST multipart request with the correct data',
      () async {
        when(
          mockClient.send(any),
        ).thenAnswer((_) async => http.StreamedResponse(Stream.value([]), 201));

        await remoteDataSource.insertProduct(tProduct);

        final captured = verify(mockClient.send(captureAny)).captured;
        final request = captured.first as http.MultipartRequest;

        expect(request.method, 'POST');
        expect(request.url.toString(), baseUrl);
        expect(request.fields['name'], tProduct.name);
        expect(request.fields['description'], tProduct.description);
        expect(request.fields['price'], tProduct.price.toString());
        expect(request.files.first.field, 'image');
        expect(
          p.basename(request.files.first.filename ?? ''),
          p.basename(tProduct.imageUrl),
        );
      },
    );

    test(
      'should throw a ServerException when the response code is not 201',
      () async {
        when(
          mockClient.send(any),
        ).thenAnswer((_) async => http.StreamedResponse(Stream.value([]), 500));
        final call = remoteDataSource.insertProduct(tProduct);
        expect(call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('updateProduct', () {
    test('should perform a PUT request with the correct data', () async {
      when(
        mockClient.put(any, body: anyNamed('body')),
      ).thenAnswer((_) async => http.Response('body', 200));

      await remoteDataSource.updateProduct(tProduct);

      verify(
        mockClient.put(
          Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${tProduct.id}',
          ),
          body: jsonEncode({
            'name': tProduct.name,
            'description': tProduct.description,
            'price': tProduct.price,
          }),
        ),
      );
    });
  });

  group('deleteProduct (DELETE)', () {
    const tProductId = '1';
    test('should perform a DELETE request to the correct URL', () async {
      when(
        mockClient.delete(any, headers: anyNamed('headers')),
      ).thenAnswer((_) async => http.Response('Success', 200));
      await remoteDataSource.deleteProduct(tProductId);

      verify(
        mockClient.delete(
          Uri.parse('$baseUrl/$tProductId'),
          headers: {'content-type': 'application/json'},
        ),
      );
    });
  });
}
