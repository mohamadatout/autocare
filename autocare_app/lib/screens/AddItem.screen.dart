import 'package:autocare_app/widgets/button.dart';
import 'package:autocare_app/widgets/inputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  var nameCotroller = TextEditingController();
  var categoryController = TextEditingController();
  var madeController = TextEditingController();
  var priceController = TextEditingController();
  var modelController = TextEditingController();
  var yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Add Item",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: [
                inputField(controller: nameCotroller, hintText: "Name"),
                inputField(
                  controller: categoryController,
                  hintText: "Category",
                ),
                inputField(
                  controller: madeController,
                  hintText: "Made",
                ),
                inputField(
                  controller: priceController,
                  hintText: "Price",
                ),
                inputField(
                  controller: modelController,
                  hintText: "Model",
                ),
                inputField(controller: yearController, hintText: "Year"),
                SizedBox(height: 30),
                Button(
                    onTap: () {},
                    text: "Add Item",
                    paddingVertical: 18,
                    paddingHorizantal: 0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
