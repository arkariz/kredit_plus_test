class ProductModel {
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
  String price;
  String description;
  String category;
  String image;
  RatingModel rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: RatingModel.fromJson(json["rating"]),
      );
}

class RatingModel {
  RatingModel({required this.rate, required this.count});

  double rate;
  int count;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: json["rate"],
        count: json["count"],
      );
}
