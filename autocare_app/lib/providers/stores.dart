import 'package:autocare_app/models/products.model.dart';
import 'package:autocare_app/models/store.model.dart';
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
    return Store(
      name: json["name"],
      products: [],
      location: "Beirut",
      email: json["email"],
      id: json["_id"],
    );
  }
}
