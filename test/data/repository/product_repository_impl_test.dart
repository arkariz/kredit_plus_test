
import 'package:flutter_test/flutter_test.dart';
import 'package:kredit_plus_test/core/util/datastate.dart';
import 'package:kredit_plus_test/features/list_product/data/models/product_model.dart';
import 'package:kredit_plus_test/features/list_product/data/repositories/product_repository_impl.dart';
import 'package:kredit_plus_test/features/list_product/domain/entities/product_entity.dart';
import 'package:mockito/mockito.dart';

import '../../helper/read_json.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late MockRemoteProductDataSource mockRemoteProductDataSource;
  late ProductRepositoryImpl repository;

  setUp(() {
    mockRemoteProductDataSource = MockRemoteProductDataSource();
    repository = ProductRepositoryImpl(
      mockRemoteProductDataSource,
    );
  });

  final productsModel = productModelFromJson(readJson('helper/dummy_data/dummy_list_product_response.json'));
  final productsEntity = productEntityFromModel(productsModel);

  Future<DataState<List<ProductEntity>>> dummySuccess() => Future.value(DataSuccess(productsEntity));
  Future<DataState<List<ProductEntity>>> dummyFailed() => Future.value(DataFailed("gagal mengambil produk"));
  Future<DataState<List<ProductEntity>>> dummyConnectionError() => Future.value(DataFailed("Gagal terhubung ke jaringan"));

  group('get list of product', () {
    test(
      'should return list of product when a call to data source is successful',
      () async {
        // arrange
        when(mockRemoteProductDataSource.getProducts()).thenAnswer((_) async => productsModel);

        // act
        final result = await repository.getProducts();

        // assert
        final response = await dummySuccess();
        verify(mockRemoteProductDataSource.getProducts());
        expect(result.data, equals(response.data));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteProductDataSource.getProducts()).thenThrow('gagal mengambil produk');

        // act
        final result = await repository.getProducts();

        // assert
        final response = await dummyFailed();
        verify(mockRemoteProductDataSource.getProducts());
        expect(result.error, equals(response.error));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockRemoteProductDataSource.getProducts()).thenThrow('Gagal terhubung ke jaringan');

        // act
        final result = await repository.getProducts();

        // assert
        final response = await dummyConnectionError();
        verify(mockRemoteProductDataSource.getProducts());
        expect(
          result.error,
          equals(response.error),
        );
      },
    );
  });
}
