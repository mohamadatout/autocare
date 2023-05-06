import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String made;
  final String model;
  final String year;
  final String price;
  final String image;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.made,
    required this.model,
    required this.year,
    required this.price,
    required this.image,
    required this.category,
  });
}
