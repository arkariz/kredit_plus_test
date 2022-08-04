import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:kredit_plus_test/features/list_product/data/datasources/remote_product_datasource.dart';
import 'package:kredit_plus_test/features/list_product/data/models/product_model.dart';
import 'package:mockito/mockito.dart';

import '../../helper/read_json.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteProductDatasourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RemoteProductDatasourceImpl(mockHttpClient);
  });

  group('get list of product', () {
    final productModel = productModelFromJson(readJson('helper/dummy_data/dummy_list_product_response.json'));

    test(
      'should return product model when the response code is 200',
      () async {
        // arrange
        when(
          mockHttpClient.get(Uri.parse("https://fakestoreapi.com/products")),
        ).thenAnswer(
          (_) async => http.Response(
            readJson('helper/dummy_data/dummy_list_product_response.json'),
            200,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          ),
        );

        // act
        final result = await dataSource.getProducts();

        // assert
        expect(result, equals(productModel));
      },
    );

    test(
      'should throw a exception when the response code is 404 or other',
      () async {
        // arrange
        when(
          mockHttpClient.get(Uri.parse("https://fakestoreapi.com/products")),
        ).thenAnswer(
          (_) async => http.Response('Not found', 404),
        );

        // act
        final call = dataSource.getProducts();

        // assert
        expect(() => call, throwsA(isA<Exception>()));
      },
    );
  });
}
