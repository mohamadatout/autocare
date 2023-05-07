import 'package:autocare_app/models/products.model.dart';
import 'package:autocare_app/models/review.model.dart';
import 'package:autocare_app/providers/products.dart';
import 'package:autocare_app/providers/reviews.dart';
import 'package:autocare_app/remote_dataSource/actions.dataSource.dart';
import 'package:flutter/material.dart';

class LoggedUser with ChangeNotifier {
  String id;
  String type;
  String name;
  String email;
  bool subscription;
  List<Product> items;
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
    final List<Product> parsedProducts = [];
    final List<Review> parsedReviews = [];

    json["items"].forEach((item) {
      parsedProducts.add(ProductsProvider.fromJSON(item));
    });

    json["reviews"].forEach((item) {
      parsedReviews.add(ReviewssProvider.fromJSON(item));
    });

    id = json["_id"];
    type = json["type"];
    name = json["name"];
    email = json["email"];
    subscription = json["subscription"];
    items = parsedProducts;
    reviews = parsedReviews;

    notifyListeners();
  }

  Future deleteProduct(storeId, productId) async {
    try {
      final res = await ActionsDataSource.deleteProduct(storeId, productId);
      items.removeWhere(
        (product) {
          print(product.id);
          print(productId);
          return product.id == productId;
        },
      );
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
}
