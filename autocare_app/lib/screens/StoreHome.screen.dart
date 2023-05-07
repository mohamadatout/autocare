import 'package:autocare_app/models/products.model.dart';
import 'package:autocare_app/models/user.model.dart';
import 'package:autocare_app/providers/products.dart';
import 'package:autocare_app/widgets/productCard.dart';
import 'package:autocare_app/widgets/searchBar.dart';
import 'package:autocare_app/widgets/store.bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class StoreHomePage extends StatefulWidget {
  const StoreHomePage({super.key});

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoggedUser>(builder: (context, value, child) {
      String storeId = value.id;
      List<Product> _products = value.items;

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
                itemCount: value.items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print("Hello");
                    },
                    child: ProductCard(
                      storeId: storeId,
                      productInfo: _products[index],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
