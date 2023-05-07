import 'package:autocare_app/models/store.model.dart';
import 'package:autocare_app/providers/stores.dart';
import 'package:autocare_app/routes/routes.dart';
import 'package:autocare_app/widgets/DisplayCard.dart';
import 'package:autocare_app/widgets/searchBar.dart';
import 'package:autocare_app/widgets/store.bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  Future fetchStores() async {
    await Provider.of<StoresProvider>(context, listen: false).getAllStores();
  }

  @override
  void initState() {
    super.initState();

    fetchStores();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoresProvider>(
      builder: (context, value, child) {
        List<Store> _stores = value.stores;
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(children: [SearchBar()]),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _stores.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                RouteManager.viewStore,
                                arguments: {
                                  "storeId": _stores[index].id,
                                },
                              );
                            },
                            child: DisplayCard(
                              text: _stores[index].name,
                              imgURL: "assets/bmw.jpg",
                              imgHeight: 150,
                              imgWidth: MediaQuery.of(context).size.width,
                              containerHeight:
                                  MediaQuery.of(context).size.height * 0.23,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
