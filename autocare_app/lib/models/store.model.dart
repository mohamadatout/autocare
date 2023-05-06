import 'package:autocare_app/models/products.model.dart';
import 'package:flutter/material.dart';

class Store {
  String name;
  String email;
  String id;
  List<Product> products;
  // List<Reviews> reviews;
  String location;

  Store({
    required this.name,
    required this.email,
    required this.id,
    required this.products,
    // required this.reviews,
    required this.location,
  });

  // void getUserFromMap(Map json) {
  //   Store user = Store(
  //     type: json["type"],
  //     name: json["name"],
  //     email: json["email"],
  //     subscription: json["subscription"],
  //   );

  //   type = json["type"];
  //   name = json["name"];
  //   email = json["email"];
  //   subscription = json["subscription"];

  //   print(json["email"]);

  //   notifyListeners();
  // }
}
