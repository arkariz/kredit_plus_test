import 'package:kredit_plus_test/features/list_product/data/models/product_model.dart';

class ProductEntity {
  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  String price;
  String description;
  String category;
  String image;
  RatingEntity rating;

  factory ProductEntity.fromModel(ProductModel model) => ProductEntity(
        id: model.id,
        title: model.title,
        price: model.price,
        description: model.description,
        category: model.category,
        image: model.image,
        rating: RatingEntity.fromModel(model.rating),
      );
}

class RatingEntity {
  RatingEntity({required this.rate, required this.count});

  double rate;
  int count;

  factory RatingEntity.fromModel(RatingModel model) => RatingEntity(
        rate: model.rate,
        count: model.count,
      );
}
