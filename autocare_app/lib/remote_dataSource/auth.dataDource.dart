import 'package:autocare_app/config/remote.config.dart';
import 'package:autocare_app/models/user.model.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

abstract class AuthDataSource {
  static Future login(email, password, context) async {
    try {
      final body = {
        "email": email,
        "password": password,
      };
      final response = await dioClient.get("/auth/login", data: body);
      print(response.data);

      if (response.data["user"]["type"] == "customer") {
        Provider.of<User>(context, listen: false)
            .getUserFromMap(response.data["user"]);
      }
    } catch (error) {
      print(
        error.toString(),
      );
    }
  }

  static Future register(name, email, password) async {
    try {
      final body = {
        "name": name,
        "email": email,
        "password": password,
        "type": ""
      };
      print(body);
      final response = await dioClient.post("/auth/register", data: body);
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
