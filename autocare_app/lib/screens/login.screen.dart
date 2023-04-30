import 'package:autocare_app/widgets/contnueWithTile.dart';
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
  // bool _isPressed = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  // void validate() => _form.currentState?.validate();

  void signUserIn() {
    Navigator.of(context).popAndPushNamed("/userHome");
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
                    controller: usernameController,
                    hintText: "Email",
                    obscureText: false,
                    pass: false,
                  ),

                  const SizedBox(height: 10),

                  // Password input
                  inputField(
                    controller: passwordController,
                    hintText: "Password",
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

                  const continueWith(
                    imgPath: "assets/google.png",
                    withApp: "google",
                  ),

                  const SizedBox(height: 50),

                  RichText(
                    text: const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "sora",
                      ),
                      children: [
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                              color: Color.fromARGB(255, 187, 50, 51),
                              decoration: TextDecoration.underline),
                        )
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
