import 'package:autocare_app/widgets/contnueWithTile.dart';
import 'package:flutter/material.dart';

import 'package:autocare_app/widgets/button.dart';
import 'package:autocare_app/widgets/inputField.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  void signUserUp() {}
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
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome",
                    style: TextStyle(fontSize: 30, fontFamily: "sora"),
                  ),
                  const Text(
                    "Nice to see you here. You can start using the app after creating a new account",
                    style: TextStyle(fontSize: 16, fontFamily: "sora"),
                  ),
                  const SizedBox(height: 20),
                  inputField(
                    controller: usernameController,
                    hintText: "Full Name",
                    obscureText: false,
                    pass: false,
                  ),
                  inputField(
                    controller: usernameController,
                    hintText: "Email",
                    obscureText: false,
                    pass: false,
                  ),
                  inputField(
                    controller: usernameController,
                    hintText: "Password",
                    obscureText: true,
                    pass: true,
                  ),
                  inputField(
                    controller: usernameController,
                    hintText: "Confirm Password",
                    obscureText: true,
                    pass: true,
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    text: const TextSpan(
                      text: 'By singing up you agree to our ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontFamily: "sora",
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms & Conditions ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 187, 50, 51),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: "and "),
                        TextSpan(
                          text: ' Privacy Policy',
                          style: TextStyle(
                            color: Color.fromARGB(255, 187, 50, 51),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Button(onTap: signUserUp, text: "Register"),
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
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ))
                    ],
                  ),
                  const SizedBox(height: 15),
                  const continueWith(
                      imgPath: "assets/google.png", withApp: "Google"),
                  const SizedBox(height: 25),
                  RichText(
                    text: const TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                              color: Color.fromARGB(255, 187, 50, 51),
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
