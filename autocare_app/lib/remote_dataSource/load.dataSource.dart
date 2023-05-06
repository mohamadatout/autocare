import 'package:autocare_app/config/remote.config.dart';

abstract class LoadDataSource {
  static Future getAllStores() async {
    try {
      final response = await sendRequest(route: "/actions/getStores");
      return response.data;
    } catch (err) {
      print(err);
    }
  }
}
