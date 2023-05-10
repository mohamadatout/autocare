import 'dart:convert';
import 'dart:io';

import 'package:autocare_app/models/user.model.dart';
import 'package:autocare_app/remote_dataSource/auth.dataDource.dart';
import 'package:autocare_app/routes/routes.dart';
import 'package:autocare_app/widgets/button.dart';
import 'package:autocare_app/widgets/store.bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  void signUserout() {
    AuthDataSource.logout();
    Navigator.of(context).popAndPushNamed(RouteManager.login);
    print("User signed out");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoggedUser>(
      builder: (context, value, child) => SafeArea(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.memory(
                      base64Decode(value.image),
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    value.name,
                    style: TextStyle(fontFamily: "Sora", fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    value.email,
                    style: TextStyle(fontFamily: "Sora", fontSize: 16),
                  ),
                  SizedBox(height: 30),
                  Button(
                    onTap: pickImage,
                    text: "Change Profile Picture",
                    paddingVertical: 10,
                    paddingHorizantal: 0,
                  ),
                  SizedBox(height: 30),
                  Button(
                    onTap: () {},
                    text: "Dark Mode",
                    paddingVertical: 10,
                    paddingHorizantal: 0,
                  ),
                  SizedBox(height: 30),
                  Button(
                    onTap: signUserout,
                    text: "Sign out",
                    paddingVertical: 10,
                    paddingHorizantal: 0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
