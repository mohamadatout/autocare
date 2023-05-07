import 'package:autocare_app/config/local_storage.config.dart';
import 'package:autocare_app/config/remote.config.dart';
import 'package:autocare_app/enums/localTypes.dart';
import 'package:autocare_app/enums/requestMethods.dart';

abstract class ActionsDataSource {
  static Future addProduct(
      storeId, name, made, model, year, price, image, category) async {
    final body = {
      "id": storeId,
      "name": name,
      "made": made,
      "model": model,
      "year": year,
      "price": price,
      "image": image,
      "category": category
    };
    try {
      final response = await sendRequest(
          route: "/actions/addItem", load: body, method: RequestMethods.POST);
      return response.data;
    } catch (err) {
      print(err);
    }
  }

  static Future deleteProduct(storeId, productId) async {
    final body = {"user": storeId, "item": productId};
  }
}
