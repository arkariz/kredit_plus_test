import 'package:flutter/material.dart';
import 'package:kredit_plus_test/core/widgets/desc_text.dart';
import 'package:kredit_plus_test/core/widgets/price_text.dart';
import 'package:kredit_plus_test/core/widgets/rating_text.dart';
import 'package:kredit_plus_test/core/widgets/title_text.dart';
import 'package:kredit_plus_test/features/list_product/domain/entities/product_entity.dart';

class ProductCardLarge extends StatelessWidget {
  const ProductCardLarge({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Stack(
            children: [
              Image.network(
                product.image,
                width: 150.89,
                height: 75,
                fit: BoxFit.scaleDown,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PriceText(text: "\$ ${product.price}"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(text: product.title),
                const SizedBox(height: 5),
                DescriptionText(text: product.description),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.star,
                    size: 12,
                  ),
                  RatingText(text: product.rating.rate.toString()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
