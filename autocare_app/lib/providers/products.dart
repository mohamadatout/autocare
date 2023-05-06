import 'package:autocare_app/models/products.model.dart';
import 'package:autocare_app/remote_dataSource/load.dataSource.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> products;

  ProductsProvider({required this.products});

  static Product fromJSON(Map json) {
    return Product(
      id: json["_id"],
      name: json["name"],
      made: json["made"],
      model: json["model"],
      year: json["year"],
      price: json["price"],
      image: json["image"],
      category: json["category"],
    );
  }
}
