import 'package:autocare_app/widgets/inputField.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: inputField(
        controller: searchController,
        fillColor: Color.fromARGB(255, 246, 246, 246),
        prefixIcon: const Icon(
          Icons.search,
          color: Color.fromARGB(255, 100, 100, 100),
        ),
        showBorder: false,
        pass: false,
        obscureText: false,
      ),
    );
  }
}
