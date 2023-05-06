import 'package:autocare_app/models/products.model.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> products;

  ProductsProvider({required this.products});

  Future getAllProducts(storeId) async {
    // try {} catch (err) {}
  }
}
