import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Color color;
  final VoidCallback func;
  final int width;
  final String? str;
  Buttons(
      {required this.color,
      required this.func,
      required this.str,
      required this.width});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: func,
          minWidth: width.toDouble(),
          height: 42.0,
          child: Text(
            str!,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
