import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool locationAlert = false;

  @override
  void initState() {
    super.initState();
    // Load the location alert state when the widget initializes
    loadLocationAlertState();
  }

  Future<void> loadLocationAlertState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? alertState = prefs.getBool('locationAlert');
    if (alertState != null) {
      setState(() {
        locationAlert = alertState;
      });
    }
  }

  Future<void> saveLocationAlertState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('locationAlert', value);
  }

  void toggleLocationAlert(bool value) {
    setState(() {
      locationAlert = value;
    });

    // Save the state when the switch value changes
    saveLocationAlertState(value);

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
