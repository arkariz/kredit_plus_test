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
  double price;
  String description;
  String category;
  String image;
  RatingEntity rating;
}

class RatingEntity {
  RatingEntity({required this.rate, required this.count});

  double rate;
  int count;
}
