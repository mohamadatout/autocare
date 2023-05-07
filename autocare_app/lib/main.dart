import 'package:autocare_app/config/local_storage.config.dart';
import 'package:autocare_app/enums/localTypes.dart';
import 'package:autocare_app/models/user.model.dart';
import 'package:autocare_app/providers/products.dart';
import 'package:autocare_app/providers/stores.dart';
import 'package:autocare_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:autocare_app/screens/Login.screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  bool _idDark = false;

  void loggedInChecker() async {
    final token = await getLocal(type: LocalTypes.String, key: "access_token");

    setState(() {
      _isLoggedIn = (token != null);
    });
  }

  @override
  void initState() {
    super.initState();
    loggedInChecker();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: LoggedUser(
              id: "",
              type: "",
              name: "",
              email: "",
              subscription: false,
              items: [],
              reviews: []),
        ),
        ChangeNotifierProvider.value(
          value: ProductsProvider(products: []),
        ),
        ChangeNotifierProvider.value(
          value: StoresProvider(stores: []),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}
