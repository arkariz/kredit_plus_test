import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kredit_plus_test/features/list_product/presentation/controller/product_controller.dart';
import 'package:kredit_plus_test/features/list_product/presentation/widgets/desktop_view.dart';
import 'package:kredit_plus_test/features/list_product/presentation/widgets/mobile_view.dart';
import 'package:kredit_plus_test/features/list_product/presentation/widgets/tablet_view.dart';
import 'package:kredit_plus_test/injector.dart';

class ListProductPage extends GetView<ProductController> {
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController(injector()));
    return Obx(
      () => Scaffold(
        body: controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : LayoutBuilder(
                builder: ((context, constraints) {
                  if (constraints.maxWidth < 600) {
                    return MobileView(controller: controller);
                  } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1080) {
                    return TabletView(controller: controller);
                  } else {
                    return DesktopView(controller: controller);
                  }
                }),
              ),
      ),
    );
  }
}
