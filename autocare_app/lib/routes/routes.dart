import 'package:autocare_app/screens/Chats.screen.dart';
import 'package:autocare_app/screens/Login.screen.dart';
import 'package:autocare_app/screens/Messages.screen.dart';
import 'package:autocare_app/screens/Profile.screen.dart';
import 'package:autocare_app/screens/Signup.screen.dart';
import 'package:autocare_app/screens/AddItem.screen.dart';
import 'package:autocare_app/screens/StoreHome.screen.dart';
import 'package:autocare_app/screens/StoreMain.screen.dart';
import 'package:autocare_app/screens/UserHome.screen.dart';
import 'package:autocare_app/screens/UserMain.screen.dart';
import 'package:autocare_app/screens/ViewStore.screen.dart';
import 'package:flutter/material.dart';

abstract class RouteManager {
  static const String login = "/login";
  static const String signup = "/signup";

  static const String chats = "/chats";
  static const String messages = "/messages";
  static const String profile = "/profile";

  static const String userMainScreen = "/userHomePage";
  static const String viewStore = "/viewStore";
  static const String favourites = "/favourites";
  static const String viewFavourites = "/viewFavourites";

  static const String storeMainScreen = "/storeHomePage";
  static const String addItem = "/additem";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Auth Routes
      case login:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );
      case signup:
        return MaterialPageRoute(
          builder: (context) => Signup(),
        );

      // Common Routes
      case profile:
        return MaterialPageRoute(
          builder: (context) => ProfilePage(),
        );
      case chats:
        return MaterialPageRoute(
          builder: (context) => ChatsScreen(),
        );
      case messages:
        return MaterialPageRoute(
          builder: (context) => MessagesScreen(),
        );

      // User Routes
      case userMainScreen:
        return MaterialPageRoute(
          builder: (context) => UserMainScreen(),
        );
      case viewStore:
        return MaterialPageRoute(
          builder: (context) => ViewStore(
            storeId: (settings.arguments as Map)["storeId"],
          ),
        );
      // case :
      //   return MaterialPageRoute(
      //     builder: (context) => ,
      //   );
      // case :
      //   return MaterialPageRoute(
      //     builder: (context) => ,
      //   );

      // Store Routes
      case storeMainScreen:
        return MaterialPageRoute(
          builder: (context) => StoreMainScreen(),
        );
      case addItem:
        return MaterialPageRoute(
          builder: (context) => AddItem(
            storeId: (settings.arguments as Map)["storeId"],
          ),
        );

      default:
        throw FormatException("Route is not found! Check routes again!");
    }
  }
}
