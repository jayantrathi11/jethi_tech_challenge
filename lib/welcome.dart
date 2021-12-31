import 'package:flutter/material.dart';
import 'package:jethi_tech/helper/buttons.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Buttons(
        color: Colors.lightBlueAccent,
        str: 'Love',
      ),
    );
  }
}
