import 'package:autocare_app/config/remote.config.dart';
import 'package:autocare_app/enums/requestMethods.dart';

abstract class LoadDataSource {
  static Future getAllStores() async {
    try {
      final response = await sendRequest(route: "/actions/getStores");
      return response.data;
    } catch (err) {
      print(err);
    }
  }

  static Future getStoresProducts(storeId) async {
    final body = {"user": storeId};
    try {
      final response = await sendRequest(
          route: "/actions/getItemsOfStore",
          load: body,
          method: RequestMethods.POST);
      return response.data;
    } catch (err) {
      print(err);
    }
  }

  static Future getStoreReviews(storeId) async {
    final body = {"user": storeId};
    try {
      final response = await sendRequest(
          route: "/actions/getReviews",
          method: RequestMethods.POST,
          load: body);
      return response.data;
    } catch (err) {
      print(err);
    }
  }
}
