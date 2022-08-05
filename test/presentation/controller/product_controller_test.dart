import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:kredit_plus_test/core/util/datastate.dart';
import 'package:kredit_plus_test/features/list_product/data/models/product_model.dart';
import 'package:kredit_plus_test/features/list_product/domain/entities/product_entity.dart';
import 'package:kredit_plus_test/features/list_product/domain/usecases/product_usecase.dart';
import 'package:kredit_plus_test/features/list_product/presentation/controller/product_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../helper/read_json.dart';
import 'product_controller_test.mocks.dart';

@GenerateMocks([ProductUsecase])
void main() {
  late MockProductUsecase mockProductUsecase;
  late ProductController controller;

  setUp(() {
    mockProductUsecase = MockProductUsecase();
    controller = ProductController(mockProductUsecase);
  });

  final listProductModel = productModelFromJson(readJson("helper/dummy_data/dummy_list_product_response.json"));

  final emptyProduct = List<ProductEntity>.empty();
  final listProduct = productEntityFromModel(listProductModel);

  Future<DataState<List<ProductEntity>>> emptyResponse() => Future.value(DataSuccess(emptyProduct));
  Future<DataState<List<ProductEntity>>> productResponse() => Future.value(DataSuccess(listProduct));
  Future<DataState<List<ProductEntity>>> errorResponse() => Future.value(DataFailed("Gagal mengambil produk"));

  test(
    'initial state product list empty',
    () async {
      //arrange
      when(mockProductUsecase.getProducts()).thenAnswer((_) async => emptyResponse());

      //act
      Get.put(controller);

      //assert
      expect(controller.productList.isEmpty, emptyProduct.isEmpty);
      Get.reset();
    },
  );

  test(
    'initial state product list not empty',
    () async {
      // arrange
      when(mockProductUsecase.getProducts()).thenAnswer((_) => productResponse());

      //act
      await Get.put(controller);

      //assert
      expect(controller.productList.length, listProduct.length);
      Get.reset();
    },
  );

  test(
    'initial state failed getting product',
    () async {
      //arrange
      when(mockProductUsecase.getProducts()).thenAnswer((_) async => errorResponse());

      //act
      Get.put(controller);

      //assert
      final response = await errorResponse();
      expect(controller.errorMessage.value, response.error);
    },
  );
}
