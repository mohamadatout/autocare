import 'package:autocare_app/models/store.model.dart';
import 'package:autocare_app/models/user.model.dart';
import 'package:autocare_app/providers/stores.dart';
import 'package:autocare_app/widgets/displayStoreProductCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StoresProvider>(
      builder: (context, storesProvider, child) =>
          Consumer<LoggedUser>(builder: (context, value, child) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Expanded(
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: value.favourites.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print("Hello");
                    },
                    child: StoreProductsDisplayCard(
                      storeId: storesProvider.stores
                          .firstWhere((store) => store.products.any((product) =>
                              product.id == value.favourites[index].id))
                          .id,
                      productInfo: value.favourites[index],
                    ),
                  );
                },
              ),
            ));
      }),
    );
  }
}
