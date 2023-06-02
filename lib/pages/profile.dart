import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
            onTap: () {
              // Add functionality for the "Location Alert" option
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
