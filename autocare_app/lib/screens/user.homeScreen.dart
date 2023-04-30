import 'package:autocare_app/widgets/DisplayCard.dart';
import 'package:autocare_app/widgets/searchBar.dart';
import 'package:autocare_app/widgets/store.bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  List<Map> stores = [
    {"name": "WaterShield", "img": "assets/google.png"},
    {"name": "Ramzi AutoCare", "img": "assets/bmw.jpg"},
    {"name": "Stylish Garage", "img": "assets/google.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SearchBar(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: stores.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      physics: PageScrollPhysics(),
                      child: Wrap(spacing: 20, children: [
                        DisplayCard(
                          text: stores[index]["name"],
                          imgURL: stores[index]["img"],
                          imgHeight: 150,
                          imgWidth: MediaQuery.of(context).size.width,
                        ),
                      ]),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
