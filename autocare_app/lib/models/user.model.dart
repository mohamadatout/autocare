import 'package:autocare_app/models/products.model.dart';
import 'package:autocare_app/models/review.model.dart';
import 'package:autocare_app/providers/products.dart';
import 'package:autocare_app/providers/reviews.dart';
import 'package:flutter/material.dart';

class LoggedUser with ChangeNotifier {
  String id;
  String type;
  String name;
  String email;
  bool subscription;
  List<dynamic> items;
  List<Review> reviews;

  LoggedUser({
    required this.id,
    required this.type,
    required this.name,
    required this.email,
    required this.subscription,
    required this.items,
    required this.reviews,
  });

  void saveUserData(Map json) {
    id = json["_id"];
    type = json["type"];
    name = json["name"];
    email = json["email"];
    subscription = json["subscription"];
    items =
        json["items"].map((item) => ProductsProvider.fromJSON(item)).toList();
    reviews = json["reviews"]
        .map((review) => ReviewssProvider.fromJSON(review))
        .toList();

    notifyListeners();
  }
}
