import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String fieldText;
  final IconData icon;

  final bool obscureText;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.fieldText,
    required this.icon,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 17,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: fieldText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.6,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.deepPurple[300],
        ),
      ),
    );
  }
}

class ErrorAuthTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String errorMessage;
  final String fieldText;
  final IconData icon;

  final bool obscureText;

  const ErrorAuthTextfield({
    super.key,
    required this.controller,
    required this.errorMessage,
    required this.fieldText,
    required this.icon,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 17,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: fieldText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
          ),
        ),
        errorText: errorMessage,
        errorStyle: const TextStyle(
            color: Color.fromARGB(255, 203, 117, 117),
            fontSize: 14.0,
            fontWeight: FontWeight.w500),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 178, 52, 52),
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          // Icons.mail,
          icon,
          color: const Color.fromARGB(255, 178, 52, 52),
        ),
      ),
    );
  }
}
