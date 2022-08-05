import 'package:flutter/material.dart';
import 'package:kredit_plus_test/core/widgets/desc_text.dart';
import 'package:kredit_plus_test/core/widgets/price_text.dart';
import 'package:kredit_plus_test/core/widgets/rating_text.dart';
import 'package:kredit_plus_test/core/widgets/title_text.dart';
import 'package:kredit_plus_test/features/list_product/domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 150.89,
        height: 228,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 150.89,
                  height: 106.95,
                  color: Colors.amber,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PriceText(text: "\$ ${product.price}"),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TitleText(text: product.title),
                  DescriptionText(text: product.description),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.star),
                  RatingText(text: product.rating.rate.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
