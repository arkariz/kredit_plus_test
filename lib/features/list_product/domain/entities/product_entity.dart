import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingEntity rating;

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
  const RatingEntity({required this.rate, required this.count});

  final double rate;
  final int count;

  @override
  List<Object?> get props => [
        rate,
        count,
      ];
}
