import 'package:autocare_app/models/review.model.dart';
import 'package:flutter/material.dart';

class ReviewssProvider with ChangeNotifier {
  List<Review> reviews;

  ReviewssProvider({required this.reviews});

  static Review fromJSON(Map json) {
    return Review(
      id: json["_id"],
      customer: json["customer"],
      review: json["review"],
    );
  }
}
