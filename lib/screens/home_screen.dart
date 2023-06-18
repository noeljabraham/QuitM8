import 'package:flutter/material.dart';
import 'package:quitm8/pages/home.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable the system back button
        return false;
      },
      child: Home(), // Display the Home page directly
    );
  }
}
