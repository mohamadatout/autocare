import 'package:autocare_app/models/user.model.dart';
import 'package:autocare_app/providers/stores.dart';
import 'package:autocare_app/remote_dataSource/actions.dataSource.dart';
import 'package:autocare_app/routes/routes.dart';
import 'package:autocare_app/widgets/DisplayCard.dart';
import 'package:autocare_app/widgets/button.dart';
import 'package:autocare_app/widgets/displayStoreProductCard.dart';
import 'package:autocare_app/widgets/inputField.dart';
import 'package:autocare_app/widgets/oneChat.dart';
import 'package:autocare_app/widgets/productCard.dart';
import 'package:autocare_app/widgets/reviewBanner.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewStore extends StatefulWidget {
  final String storeId;
  const ViewStore({super.key, required this.storeId});

  @override
  State<ViewStore> createState() => _ViewStoreState();
}

class _ViewStoreState extends State<ViewStore> {
  var userReview = TextEditingController();

  Future writeReview(context) async {
    final String userId = Provider.of<LoggedUser>(context, listen: false).id;
    await Provider.of<StoresProvider>(context, listen: false).writeReview(
      widget.storeId,
      userId,
      userReview.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoresProvider>(
      builder: (context, value, child) {
        final store =
            value.stores.firstWhere((str) => str.id == widget.storeId);
        final lastReview = store.reviews[store.reviews.length - 1];
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              store.name,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(
                          onTap: () {
                            print("Message btn pressed");
                          },
                          text: "Message",
                          paddingVertical: 10,
                          paddingHorizantal: 20,
                        ),
                        Button(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RouteManager.viewMap);
                          },
                          text: "View Location",
                          paddingVertical: 10,
                          paddingHorizantal: 20,
                        ),
                      ],
                    ),
                  ),
                  //
                  SizedBox(height: 20),
                  //
                  Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Reviews",
                                style: TextStyle(
                                  fontFamily: "sora",
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "View All",
                                style: TextStyle(
                                  fontFamily: "sora",
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 187, 50, 51),
                                ),
                              ),
                            ],
                          ),
                          //
                          SizedBox(height: 5),
                          //
                          GestureDetector(
                            onTap: () {
                              print("hello");
                            },
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Write a review",
                                              style: TextStyle(
                                                fontFamily: "sora",
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            inputField(
                                              controller: userReview,
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Button(
                                              onTap: () {
                                                writeReview(context);
                                                Navigator.pop(context);
                                              },
                                              text: "Submit",
                                              paddingVertical: 18,
                                              paddingHorizantal: 20,
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Color.fromARGB(255, 187, 50, 51),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Write a review",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 187, 50, 51),
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //
                          const SizedBox(
                            height: 5,
                          ),
                          ReviewBanner(
                              name: lastReview.customer,
                              review: lastReview.review)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "Our Products",
                        style: TextStyle(fontSize: 20, fontFamily: "sora"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: store.products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("Hello");
                          },
                          child: StoreProductsDisplayCard(
                            storeId: store.id,
                            productInfo: store.products[index],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
