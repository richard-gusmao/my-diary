import 'package:flutter/material.dart';

class BigTextField extends StatelessWidget {
  final TextEditingController myController;
  final double size;
  final double height;
  final String placeholder;
  const BigTextField(
      {super.key,
      required this.myController,
      required this.size,
      required this.height,
      required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      maxLines: null,
      decoration: InputDecoration(
        hintText: placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
      ),
      style: TextStyle(
        color: Colors.black87,
        fontSize: size,
        height: height,
      ),
    );
  }
}
