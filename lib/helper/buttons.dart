import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
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
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: widget.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: widget.func,
          minWidth: widget.width.toDouble(),
          height: 42.0,
          child: Text(
            widget.str!,
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
