import 'package:autocare_app/models/products.model.dart';
import 'package:autocare_app/models/review.model.dart';
import 'package:autocare_app/models/store.model.dart';
import 'package:autocare_app/providers/products.dart';
import 'package:autocare_app/providers/reviews.dart';
import 'package:autocare_app/remote_dataSource/load.dataSource.dart';
import 'package:flutter/foundation.dart';

class StoresProvider with ChangeNotifier {
  List<Store> stores;

  StoresProvider({required this.stores});

  Future getAllStores() async {
    try {
      final res = await LoadDataSource.getAllStores();

      List<Store> _stores = [];

      res.forEach((jsonStore) {
        final Store store = fromJSON(jsonStore);

        _stores.add(store);
      });

      stores = _stores;

      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  Store fromJSON(Map json) {
    final List<Product> parsedProducts = [];
    final List<Review> parsedReviews = [];

    json["items"].forEach((item) {
      parsedProducts.add(ProductsProvider.fromJSON(item));
    });

    json["reviews"].forEach((item) {
      parsedReviews.add(ReviewssProvider.fromJSON(item));
    });

    notifyListeners();
    return Store(
      name: json["name"],
      products: parsedProducts,
      reviews: parsedReviews,
      location: "Beirut",
      email: json["email"],
      id: json["_id"],
    );
  }
}
