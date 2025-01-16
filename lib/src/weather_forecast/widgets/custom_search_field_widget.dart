import 'package:flutter/material.dart';

class CustomSearchFieldWidget extends StatelessWidget {
  const CustomSearchFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white, // Change this to your desired color
      ),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        fillColor: Color(0x15FFFFFF),
        filled: true,
        hintText: "Digite a cidade",
        hintStyle: TextStyle(
          color: Colors.white, // Change this to your desired color
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
