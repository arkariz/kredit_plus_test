import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
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
  double price;
  String description;
  String category;
  String image;
  RatingEntity rating;

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

class RatingEntity extends Equatable {
  RatingEntity({required this.rate, required this.count});

  double rate;
  int count;

  @override
  List<Object?> get props => [
        rate,
        count,
      ];
}
