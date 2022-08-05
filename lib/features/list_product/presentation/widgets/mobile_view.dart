import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kredit_plus_test/features/list_product/presentation/controller/product_controller.dart';
import 'package:kredit_plus_test/features/list_product/presentation/widgets/product_card_small.dart';

class MobileView extends StatelessWidget {
  const MobileView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final height = size.height * 0.85;
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 330,
        height: height,
        child: Obx(
          () => ListView.builder(
            itemCount: controller.productList.take(4).length,
            itemBuilder: ((context, index) {
              return ProductCardSmall(
                product: controller.productList[index],
              );
            }),
          ),
        ),
      ),
    );
  }
}
