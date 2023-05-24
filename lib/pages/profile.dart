import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // Your existing code for the profile page
          ),
          Positioned(
            top: 16,
            left: 16,
            child: CircleAvatar(
              // Customize the profile icon as per your requirements
              radius: 40,
              backgroundColor: Colors.deepPurple[200],
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
