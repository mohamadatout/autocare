import 'package:autocare_app/models/user.model.dart';
import 'package:autocare_app/widgets/button.dart';
import 'package:autocare_app/widgets/inputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {
  final String storeId;
  const AddItem({super.key, required this.storeId});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  var nameCotroller = TextEditingController();
  String categoryController = "Washing";
  var madeController = TextEditingController();
  var priceController = TextEditingController();
  var modelController = TextEditingController();
  var yearController = TextEditingController();

  Future addItem() async {
    await Provider.of<LoggedUser>(context, listen: false).addProduct(
        widget.storeId,
        nameCotroller.text,
        madeController.text,
        modelController.text,
        yearController.text,
        priceController.text,
        "assets/bmw.jpg",
        categoryController);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          "Add Item",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  inputField(
                    controller: nameCotroller,
                    hintText: "Name",
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
                  DropdownButton<String>(
                    value: categoryController,
                    items: [
                      const DropdownMenuItem(
                        child: Text("Interior Parts"),
                        value: "Interior",
                      ),
                      const DropdownMenuItem(
                        child: Text("Exterior Parts"),
                        value: "Exterior",
                      ),
                      const DropdownMenuItem(
                        child: Text("Other Parts"),
                        value: "Parts",
                      ),
                      const DropdownMenuItem(
                        child: Text("Motor Parts"),
                        value: "Motor",
                      ),
                      DropdownMenuItem(
                        child: Text("Washing"),
                        value: "Washing",
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        categoryController = value!;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  Button(
                      onTap: () {
                        addItem();
                      },
                      text: "Add Item",
                      paddingVertical: 18,
                      paddingHorizantal: 0)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
