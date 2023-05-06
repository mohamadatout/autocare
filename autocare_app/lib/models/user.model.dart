import 'package:flutter/material.dart';

class LoggedUser with ChangeNotifier {
  String type;
  String name;
  String email;
  bool subscription;

  LoggedUser({
    required this.type,
    required this.name,
    required this.email,
    required this.subscription,
  });

  void saveUserData(Map json) {
    type = json["type"];
    name = json["name"];
    email = json["email"];
    subscription = json["subscription"];

    notifyListeners();
  }
}
