import 'package:get/get.dart';
import 'package:kredit_plus_test/core/util/datastate.dart';
import 'package:kredit_plus_test/features/list_product/domain/entities/product_entity.dart';
import 'package:kredit_plus_test/features/list_product/domain/usecases/product_usecase.dart';

class ProductController extends GetxController {
  final ProductUsecase _usecase;

  ProductController(this._usecase);

  final productList = List<ProductEntity>.empty(growable: true).obs;

  final isLoading = false.obs;
  final errorMessage = "".obs;

  @override
  void onInit() async {
    await getProducts();
    super.onInit();
  }

  Future getProducts() async {
    isLoading(true);

    final products = await _usecase.getProducts();
    if (products is DataSuccess) {
      if (products.data != null) {
        productList.addAll(products.data!);
      }
    } else {
      errorMessage(products.error);
      // Get.snackbar("Info", errorMessage.value);
    }

    isLoading(false);
  }
}
