import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:kredit_plus_test/features/list_product/domain/entities/product_entity.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));
List<ProductEntity> productEntityFromModel(List<ProductModel> model) => List<ProductEntity>.from(model.map((e) => e.toEntity()));

class ProductModel extends Equatable {
  ProductModel({
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
  double price;
  String description;
  String category;
  String image;
  RatingModel rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: double.parse(json["price"].toString()),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: RatingModel.fromJson(json["rating"]),
      );

  ProductEntity toEntity() => ProductEntity(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        image: image,
        rating: rating.toEntity(),
      );

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        rating,
      ];
}

class RatingModel extends Equatable {
  RatingModel({required this.rate, required this.count});

  double rate;
  int count;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: double.parse(json["rate"].toString()),
        count: json["count"],
      );

  RatingEntity toEntity() => RatingEntity(rate: rate, count: count);

  @override
  List<Object?> get props => [
        rate,
        count,
      ];
}
