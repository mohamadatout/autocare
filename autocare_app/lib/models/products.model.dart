import 'package:flutter/material.dart';

class Product {
  String name;
  String made;
  String model;
  String year;
  double price;
  String image;
  String category;

  Product({
    required this.name,
    required this.made,
    required this.model,
    required this.year,
    required this.price,
    required this.image,
    required this.category,
  });

  void getProductFromMap(Map json) {
    Product product = Product(
      name: json["name"],
      made: json["made"],
      model: json["model"],
      year: json["year"],
      price: json["price"],
      image: json["image"],
      category: json["category"],
    );

    name = json["name"];
    made = json["made"];
    model = json["model"];
    year = json["year"];
    price = json["price"];
    image = json["image"];
    category = json["category"];
  }
}
