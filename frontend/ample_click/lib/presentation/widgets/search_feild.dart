import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFeild extends StatelessWidget {
  final hint_text;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const SearchFeild({
    super.key,
    required this.hint_text,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: Theme.of(context).primaryColorLight,
          hintText: hint_text,
          hintStyle: TextStyle(fontSize: 16),
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
