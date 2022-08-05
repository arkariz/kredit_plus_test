import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:kredit_plus_test/features/list_product/data/models/product_model.dart';
import 'package:kredit_plus_test/features/list_product/domain/entities/product_entity.dart';

import '../../helper/read_json.dart';

// import '../../helpers/json_reader.dart';

void main() {
  const ratingModel = RatingModel(rate: 3.9, count: 120);
  const productModel = ProductModel(
    id: 1,
    title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    price: 109.95,
    description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    category: "men's clothing",
    image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    rating: ratingModel,
  );

  const ratingEntity = RatingEntity(rate: 3.9, count: 120);
  const productEntity = ProductEntity(
    id: 1,
    title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    price: 109.95,
    description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    category: "men's clothing",
    image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    rating: ratingEntity,
  );

  group('to entity', () {
    test(
      'should be a subclass of product entity',
      () async {
        // assert
        final result = productModel.toEntity();
        expect(result, equals(productEntity));
      },
    );
  });

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(
          readJson('helper/dummy_data/dummy_product_response.json'),
        );
        // act
        final result = ProductModel.fromJson(jsonMap);

        // assert
        expect(result, equals(productModel));
      },
    );
  });
}
