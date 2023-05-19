import 'package:flutter/material.dart';
import 'package:quitm8/screens/welcome_screen.dart';
import 'package:quitm8/screens/login_page.dart';
import 'package:quitm8/screens/signup_page.dart';
import 'package:quitm8/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';qwe

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(QuitM8App());
}

class QuitM8App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuitM8',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        LoginPage.routeName: (context) => LoginPage(),
        SignupPage.routeName: (context) => SignupPage(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
