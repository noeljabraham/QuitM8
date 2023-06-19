import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quitm8/screens/welcome_screen.dart';
import 'package:quitm8/screens/login_page.dart';
import 'package:quitm8/screens/signup_page.dart';
import 'package:quitm8/screens/home_screen.dart';
import 'package:quitm8/screens/addiction_options_page.dart'; // Import the AddictionOptionsPage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(QuitM8App());
}

class QuitM8App extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
0
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuitM8',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: _auth.currentUser != null
          ? HomeScreen.routeName
          : WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        LoginPage.routeName: (context) => LoginPage(),
        SignupPage.routeName: (context) => SignupPage(),
        HomeScreen.routeName: (context) => HomeScreen(),
        AddictionOptionsPage.routeName: (context) =>
            AddictionOptionsPage(), // Add the route for the AddictionOptionsPage
      },
    );
  }
}
