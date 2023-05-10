import 'package:autocare_app/config/remote.config.dart';
import 'package:autocare_app/enums/localTypes.dart';
import 'package:autocare_app/models/user.model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import "package:autocare_app/config/local_storage.config.dart";

abstract class AuthDataSource {
  static Future<String?> login(email, password, context) async {
    try {
      final body = {
        "email": email,
        "password": password,
      };
      print(body);
      final response = await sendRequest(route: "/auth/login", load: body);
      print(response.data);

      // setLocal(
      //     type: LocalTypes.String, key: "access_token", value: response.data);

      Provider.of<LoggedUser>(context, listen: false)
          .saveUserData(response.data["user"]);

      return response.data["user"]["type"] == "customer" ? "customer" : "store";
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

  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> googlelogin() => _googleSignIn.signIn();

  static Future logout() async {
    _googleSignIn.signOut();
  }
}
