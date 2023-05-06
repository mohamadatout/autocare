import 'package:autocare_app/models/products.model.dart';
import 'package:autocare_app/models/review.model.dart';
import 'package:flutter/material.dart';

class Store {
  String name;
  String email;
  String id;
  List<Product> products;
  List<Review> reviews;
  String location;

  Store({
    required this.name,
    required this.email,
    required this.id,
    required this.products,
    required this.reviews,
    required this.location,
  });
}
