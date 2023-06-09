import 'package:autocare_app/remote_dataSource/auth.dataDource.dart';
import 'package:autocare_app/routes/routes.dart';
import 'package:autocare_app/widgets/contnueWithTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/inputField.dart';
import '../widgets/button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _firebase = FirebaseAuth.instance;
  var emailInput = TextEditingController();
  var passwordInput = TextEditingController();

  void signUserIn() async {
    try {
      final userType = await AuthDataSource.login(
          emailInput.text, passwordInput.text, context);
      if (userType != null) {
        _firebase.signInWithEmailAndPassword(
            email: emailInput.text, password: passwordInput.text);
        if (userType == "customer") {
          Navigator.of(context).popAndPushNamed(RouteManager.userMainScreen);
        } else {
          Navigator.of(context).popAndPushNamed(RouteManager.storeMainScreen);
        }
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("This email is already registered with another account."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "AutoCare",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 187, 50, 51),
                      fontFamily: "Race",
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Sora",
                        fontWeight: FontWeight.w500),
                  ),

                  const Text(
                    "Nice to see you again. You can continue where you left by logging in",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Sora",
                        fontWeight: FontWeight.w400),
                  ),

                  const SizedBox(height: 40),

                  // Email input
                  inputField(
                    controller: emailInput,
                    hintText: "Email",
                    obscureText: false,
                    pass: false,
                  ),

                  const SizedBox(height: 10),

                  // Password input
                  inputField(
                    controller: passwordInput,
                    hintText: "Password",
                    // fillColor: Color.fromARGB(255, 30, 30, 30),
                    obscureText: true,
                    pass: true,
                  ),

                  const SizedBox(height: 3),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Forget password?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 50, 51),
                            fontFamily: "sora"),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Button(
                    onTap: signUserIn,
                    text: "Sign in",
                    paddingHorizantal: 16,
                    paddingVertical: 16,
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "OR",
                          style:
                              TextStyle(color: Colors.grey, fontFamily: "sora"),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ))
                    ],
                  ),

                  const SizedBox(height: 30),

                  GestureDetector(
                    onTap: () async {
                      final user = await AuthDataSource.googlelogin();
                      print(user);

                      if (user != null) {
                        Navigator.of(context)
                            .popAndPushNamed(RouteManager.userMainScreen);
                      }
                    },
                    child: const continueWith(
                      imgPath: "assets/google.png",
                      withApp: "Google",
                    ),
                  ),

                  const SizedBox(height: 50),

                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "sora",
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context)
                                .popAndPushNamed(RouteManager.signup),
                          text: "Register",
                          style: TextStyle(
                              color: Color.fromARGB(255, 187, 50, 51),
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
