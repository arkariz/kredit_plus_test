import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kredit_plus_test/features/list_product/presentation/controller/product_controller.dart';
import 'package:kredit_plus_test/features/list_product/presentation/widgets/product_card_large.dart';
import 'package:kredit_plus_test/injector.dart';

class ListProductPage extends GetView<ProductController> {
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController(injector()));
    Size size = MediaQuery.of(context).size;
    final width = size.width * 0.95;
    final height = size.height * 0.66;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: Obx(
            () => GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 1.45,
              ),
              itemCount: controller.productList.take(16).length,
              itemBuilder: (BuildContext context, index) {
                return ProductCardLarge(product: controller.productList[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
