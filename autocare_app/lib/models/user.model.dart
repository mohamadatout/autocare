import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String type;
  String name;
  String email;
  bool subscription;

  User({
    required this.type,
    required this.name,
    required this.email,
    required this.subscription,
  });

  void getUserFromMap(Map json) {
    User user = User(
      type: json["type"],
      name: json["name"],
      email: json["email"],
      subscription: json["subscription"],
    );

    type = json["type"];
    name = json["name"];
    email = json["email"];
    subscription = json["subscription"];

    print(json["email"]);

    notifyListeners();
  }
}
