import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kredit_plus_test/features/list_product/presentation/controller/product_controller.dart';
import 'package:kredit_plus_test/features/list_product/presentation/widgets/product_card_large.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final width = size.width * 0.95;
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: 430,
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
