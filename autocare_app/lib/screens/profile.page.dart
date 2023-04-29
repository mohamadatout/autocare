import 'package:autocare_app/widgets/button.dart';
import 'package:autocare_app/widgets/store.bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // File? image;

  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;

  //     final imageTemporary = File(image.path);
  //     setState(() => this.image = imageTemporary);
  //   } on PlatformException catch (e) {
  //     print("Failed to pick image : $e");
  //   }
  // }

  void signUserout() {
    print("User signed out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/bmw.jpg",
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Mohamad Atout",
                    style: TextStyle(fontFamily: "Sora", fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "mohamad.atout0@gmail.com",
                    style: TextStyle(fontFamily: "Sora", fontSize: 16),
                  ),
                  SizedBox(height: 30),
                  Button(
                    onTap: () {},
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
