import 'package:flutter/material.dart';
import './addiction_options_page.dart';
import 'package:quitm8/pages/home.dart';
import 'package:quitm8/pages/community.dart';
import 'package:quitm8/pages/motivation.dart';
import 'package:quitm8/pages/profile.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pageTitles = [
    const Home(),
     CommunityPage(),
    const Motivation(),
    const Profile(),
  ];

  String addictionText = ''; // Variable to store the addiction text

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPlusPressed(BuildContext context) {
    Navigator.pushReplacementNamed(context, AddictionOptionsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable the system back button
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.purple,
          elevation: 0,
          automaticallyImplyLeading: false, // Hide the back arrow
        ),
          body: Center(
            child: _pageTitles.elementAt(_selectedIndex),
          ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.purple,
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb),
              label: 'Motivation',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
