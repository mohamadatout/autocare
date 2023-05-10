import 'dart:convert';

import 'package:autocare_app/models/products.model.dart';
import 'package:autocare_app/models/user.model.dart';
import 'package:autocare_app/providers/products.dart';
import 'package:autocare_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreProductsDisplayCard extends StatefulWidget {
  final String storeId;
  final Product productInfo;

  const StoreProductsDisplayCard(
      {super.key, required this.productInfo, required this.storeId});

  @override
  State<StoreProductsDisplayCard> createState() =>
      _StoreProductsDisplayCardState();
}

class _StoreProductsDisplayCardState extends State<StoreProductsDisplayCard> {
  // Future deleteProduct() async {
  //   await Provider.of<LoggedUser>(context, listen: false)
  //       .deleteProduct(widget.storeId, widget.productInfo.id);
  // }

  Future favAddRemove() async {
    await Provider.of<LoggedUser>(context, listen: false)
        .favAddRemove(widget.storeId, widget.productInfo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoggedUser>(
      builder: (context, value, child) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 246, 246, 246),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productInfo.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.productInfo.made),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(widget.productInfo.model),
                              const Text(" • "),
                              Text(widget.productInfo.year),
                            ],
                          ),
                          Text("${widget.productInfo.price} \$"),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            favAddRemove();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 187, 50, 51),
                          ),
                          child: Text(value.favourites.any(
                                  (item) => item.id == widget.productInfo.id)
                              ? "Remove Favourite"
                              : "Add Favourite"),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.memory(
                        base64Decode(widget.productInfo.image),
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
