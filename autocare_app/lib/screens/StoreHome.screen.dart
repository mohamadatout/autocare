import 'package:autocare_app/widgets/productCard.dart';
import 'package:autocare_app/widgets/searchBar.dart';
import 'package:autocare_app/widgets/store.bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StoreHomePage extends StatefulWidget {
  const StoreHomePage({super.key});

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  List<Map> data = [
    {
      "name": "Data 1",
      "made": "Data 1",
      "model": "Data 1",
      "year": "Data 1",
      "price": "Data 1",
      "image": "Data 1",
      "category": "Data 1",
    },
    {
      "name": "Data 2",
      "made": "Data 2",
      "model": "Data 2",
      "year": "Data 2",
      "price": "Data 2",
      "image": "Data 2",
      "category": "Data 2",
    },
    {
      "name": "Data 3",
      "made": "Data 3",
      "model": "Data 3",
      "year": "Data 3",
      "price": "Data 3",
      "image": "Data 3",
      "category": "Data 3",
    },
    {
      "name": "Data 4",
      "made": "Data 4",
      "model": "Data 4",
      "year": "Data 4",
      "price": "Data 4",
      "image": "Data 4",
      "category": "Data 4",
    },
    {
      "name": "Data 5",
      "made": "Data 5",
      "model": "Data 5",
      "year": "Data 5",
      "price": "Data 5",
      "image": "Data 5",
      "category": "Data 5",
    },
    {
      "name": "Data 6",
      "made": "Data 6",
      "model": "Data 6",
      "year": "Data 6",
      "price": "Data 6",
      "image": "Data 6",
      "category": "Data 6",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: ScrollPhysics(parent: null),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print("Hello");
                  },
                  child: ProductCard(
                    imgURL: data[index]["image"],
                    name: data[index]["name"],
                    made: data[index]["made"],
                    model: data[index]["model"],
                    year: data[index]["year"],
                    price: data[index]["price"],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
