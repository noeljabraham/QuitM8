import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool locationAlert = false;
  bool colorTheme = false;

  @override
  void initState() {
    super.initState();
    // Load the saved settings when the widget initializes
    loadSettings();
  }

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? alertState = prefs.getBool('locationAlert');
    bool? themeState = prefs.getBool('colorTheme');
    if (alertState != null) {
      setState(() {
        locationAlert = alertState;
      });
    }
    if (themeState != null) {
      setState(() {
        colorTheme = themeState;
      });
    }
  }

  Future<void> saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('locationAlert', locationAlert);
    await prefs.setBool('colorTheme', colorTheme);
  }

  void toggleLocationAlert(bool value) {
    setState(() {
      locationAlert = value;
    });

    // Save the settings when the switch value changes
    saveSettings();

    // Handle enabling/disabling the location_alert code here
    if (value) {
      // Activate the location_alert code
      // Add your code here for enabling the location_alert functionality
      print('Location Alert enabled');
    } else {
      // Deactivate the location_alert code
      // Add your code here for disabling the location_alert functionality
      print('Location Alert disabled');
    }
  }

  void toggleColorTheme(bool value) {
    setState(() {
      colorTheme = value;
    });

    // Save the settings when the switch value changes
    saveSettings();

    // Handle enabling/disabling the color theme code here
    if (value) {
      // Activate the color theme code
      // Add your code here for enabling the color theme functionality
      print('Color Theme enabled');
    } else {
      // Deactivate the color theme code
      // Add your code here for disabling the color theme functionality
      print('Color Theme disabled');
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.deepPurple[200],
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Email: ${user?.email ?? 'Unknown'}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'General Settings',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.only(left: 4),
              child: Icon(
                Icons.star,
                color: Colors.deepPurple,
              ),
            ),
            title: Text(
              'Go Premium',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Unlock all the features of the app',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            onTap: () {
              // Add functionality for the "Go Premium" option
            },
          ),
          Divider(
            color: Colors.grey.withOpacity(0.2),
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.only(left: 4),
              child: Icon(
                Icons.location_on,
                color: Colors.deepPurple,
              ),
            ),
            title: Text(
              'Location Alert',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Alerts you before stepping in',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            trailing: CupertinoSwitch(
              value: locationAlert,
              onChanged: toggleLocationAlert,
            ),
            onTap: () {
              toggleLocationAlert(!locationAlert);
            },
          ),
          Divider(
            color: Colors.grey.withOpacity(0.2),
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: Container(
              padding: EdgeInsets.only(left: 4),
              child: Icon(
                Icons.color_lens,
                color: Colors.deepPurple,
              ),
            ),
            title: Text(
              'Color Theme',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Change the color theme of the app',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            trailing: CupertinoSwitch(
              value: colorTheme,
              onChanged: toggleColorTheme,
            ),
            onTap: () {
              toggleColorTheme(!colorTheme);
            },
          ),
          Divider(
            color: Colors.grey.withOpacity(0.2),
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          // Add your existing code for the profile page here
          // ...
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}
