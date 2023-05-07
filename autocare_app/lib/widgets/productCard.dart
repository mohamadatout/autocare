// import 'dart:html';
// import 'dart:js';

import 'package:autocare_app/models/products.model.dart';
import 'package:autocare_app/models/user.model.dart';
import 'package:autocare_app/providers/products.dart';
import 'package:autocare_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final String storeId;
  final Product productInfo;

  const ProductCard(
      {super.key, required this.productInfo, required this.storeId});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Future deleteProduct() async {
    await Provider.of<LoggedUser>(context, listen: false)
        .deleteProduct(widget.storeId, widget.productInfo.id);
  }

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                        deleteProduct();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color.fromARGB(255, 187, 50, 51),
                      ),
                      child: const Text("Delete"),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/bmw.jpg",
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
  }
}
