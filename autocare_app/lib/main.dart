import 'package:autocare_app/helpers/color.constructor.dart';
import 'package:autocare_app/models/user.model.dart';
import 'package:autocare_app/routes/routes.dart';
import 'package:autocare_app/screens/Map.screen.dart';
import 'package:autocare_app/screens/StoreMain.screen.dart';
import 'package:autocare_app/screens/UserHome.screen.dart';
import 'package:autocare_app/screens/UserMain.screen.dart';
import 'package:autocare_app/widgets/Messages.dart';
import 'package:flutter/material.dart';

import 'package:autocare_app/widgets/store.bottomNavbar.dart';
import 'package:autocare_app/screens/Main.screen.dart';
import 'package:autocare_app/screens/Signup.screen.dart';
import 'package:autocare_app/screens/Chats.screen.dart';
import 'package:autocare_app/screens/Login.screen.dart';
import 'package:autocare_app/screens/Messages.screen.dart';
import 'package:autocare_app/screens/Profile.screen.dart';
import 'package:autocare_app/screens/AddItem.screen.dart';
import 'package:autocare_app/screens/StoreHome.screen.dart';
import 'package:autocare_app/screens/ViewStore.screen.dart';
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: User(type: "", name: "", email: "", subscription: false),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(displaySmall: TextStyle(fontSize: 14))),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch:
              createMaterialColor(const Color.fromARGB(255, 187, 50, 51)),
          accentColor: const Color.fromARGB(255, 217, 217, 217),
          cardColor: const Color.fromARGB(255, 246, 246, 246),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          textTheme: const TextTheme(
            // AutoCare Logo Display
            displayLarge: TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontFamily: "race",
            ),
            // AppBar Titles
            displayMedium: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: "sora",
            ),
            // Inputs
            labelSmall: TextStyle(
              fontSize: 14,
              fontFamily: "sora",
              color: Color.fromARGB(255, 100, 100, 100),
            ),
            // Welcoming Title
            titleLarge: TextStyle(
              fontSize: 30,
              fontFamily: "Sora",
              fontWeight: FontWeight.w500,
            ),
            // Welcoming Text - Continue with Google
            titleMedium: TextStyle(
              fontSize: 16,
              fontFamily: "Sora",
              fontWeight: FontWeight.w400,
            ),
            titleSmall: TextStyle(),
            //
            bodyLarge: TextStyle(),
            bodyMedium: TextStyle(),
            bodySmall: TextStyle(),

            // bodyText1: const TextStyle(
            //   color: Color.fromARGB(255, 0, 0, 0),
            //   fontFamily: "sora",
            // ),
          ),
        ),
        home: const UserMainScreen(),
        // initialRoute: RouteManager.login,
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}
