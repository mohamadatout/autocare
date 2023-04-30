import 'package:autocare_app/widgets/button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imgURL;
  final String name;
  final String made;
  final String model;
  final String year;
  final String price;

  const ProductCard({
    super.key,
    required this.imgURL,
    required this.name,
    required this.made,
    required this.model,
    required this.year,
    required this.price,
  });

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
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(made),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(model),
                          const Text(" • "),
                          Text(year),
                        ],
                      ),
                      Text("$price \$"),
                    ],
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("Item deleted");
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
