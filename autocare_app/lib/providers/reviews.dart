import 'package:autocare_app/models/review.model.dart';
import 'package:autocare_app/remote_dataSource/load.dataSource.dart';
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

  Future getStoresReviews(storeId) async {
    try {
      final res = await LoadDataSource.getStoreReviews(storeId);

      List<Review> _reviews = [];

      res.forEach((jsonStore) {
        final Review product = fromJSON(jsonStore);

        _reviews.add(product);
      });

      reviews = _reviews;

      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
}
