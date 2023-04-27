import 'package:autocare_app/widgets/inputField.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return inputField(
      controller: searchController,
      fillColor: Color.fromARGB(255, 246, 246, 246),
      prefixIcon: const Icon(
        Icons.search,
        color: Color.fromARGB(255, 100, 100, 100),
      ),
      showBorder: false,
      pass: false,
      obscureText: false,
    );
  }
}
