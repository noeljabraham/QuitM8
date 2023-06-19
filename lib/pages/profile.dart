import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitm8/providers/notification_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool locationAlert = false;
  bool googleDriveBackup = false;
  bool progressNotification = false;
  NotificationManager notificationManager = NotificationManager();

  @override
  void initState() {
    super.initState();
    // Load the location alert, Google Drive backup, and progress notification state when the widget initializes
    loadLocationAlertState();
    loadGoogleDriveBackupState();
    loadProgressNotificationState();
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

  Future<void> loadGoogleDriveBackupState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? backupState = prefs.getBool('googleDriveBackup');
    if (backupState != null) {
      setState(() {
        googleDriveBackup = backupState;
      });
    }
  }

  Future<void> saveGoogleDriveBackupState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('googleDriveBackup', value);
  }

  Future<void> loadProgressNotificationState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? notificationState = prefs.getBool('progressNotification');
    if (notificationState != null) {
      setState(() {
        progressNotification = notificationState;
      });
    }
  }

  Future<void> saveProgressNotificationState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('progressNotification', value);
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

  void toggleGoogleDriveBackup(bool? value) {
    if (value != null) {
      setState(() {
        googleDriveBackup = value;
      });

      // Save the state when the switch value changes
      saveGoogleDriveBackupState(value);

      // Handle enabling/disabling the Google Drive backup code here
      if (value) {
        // Activate the Google Drive backup code
        // Add your code here for enabling the Google Drive backup functionality
        print('Google Drive Backup enabled');
      } else {
        // Deactivate the Google Drive backup code
        // Add your code here for disabling the Google Drive backup functionality
        print('Google Drive Backup disabled');
      }
    }
  }

  void toggleProgressNotification(bool? value) {
    if (value != null) {
      setState(() {
        progressNotification = value;
      });

      // Save the state when the switch value changes
      saveProgressNotificationState(value);

      // Handle enabling/disabling the progress notification code here
      if (value) {
        // Activate the progress notification code
        // Add your code here for enabling the progress notification functionality
        notificationManager.progressNotificationEnabled = true;
        notificationManager.scheduleProgressNotification();
        print('Progress Notification enabled');
      } else {
        // Deactivate the progress notification code
        // Add your code here for disabling the progress notification functionality
        notificationManager.progressNotificationEnabled = false;
        notificationManager.cancelScheduledNotifications();
        print('Progress Notification disabled');
      }
    }
  }

  @override
  void dispose() {
    notificationManager.cancelScheduledNotifications();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'images/7153150.png', // Replace with the path to your profile image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
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
                  color: Colors.deepPurple[500],
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
                  Icons.backup,
                  color: Colors.deepPurple,
                ),
              ),
              title: Text(
                'Google Drive Backup',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Automatically backup data',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              trailing: Checkbox(
                value: googleDriveBackup,
                onChanged: toggleGoogleDriveBackup,
              ),
              onTap: () {
                toggleGoogleDriveBackup(!googleDriveBackup);
              },
            ),
            Divider(
              color: Colors.grey.withOpacity(0.2),
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              title: Text(
                'Notification Settings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                padding: EdgeInsets.only(left: 4),
                child: Icon(
                  Icons.notifications,
                  color: Colors.deepPurple,
                ),
              ),
              title: Text(
                'Progress Notification',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Receive progress updates',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              trailing: CupertinoSwitch(
                value: progressNotification,
                onChanged: toggleProgressNotification,
              ),
              onTap: () {
                toggleProgressNotification(!progressNotification);
              },
            ),
            Divider(
              color: Colors.grey.withOpacity(0.2),
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              title: Text(
                'Other',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                padding: EdgeInsets.only(left: 4),
                child: Icon(
                  Icons.feedback,
                  color: Colors.deepPurple,
                ),
              ),
              title: Text(
                'Send Feedback',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                final Uri _emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'noeljabraham35@gmail.com',
                );

                if (await canLaunch(_emailLaunchUri.toString())) {
                  await launch(_emailLaunchUri.toString());
                } else {
                  throw 'Could not launch email';
                }
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
                  Icons.lock,
                  color: Colors.deepPurple,
                ),
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                final String url =
                    'https://nteknj.blogspot.com/2023/06/policy-for-addiction-relief-app.html'; // Replace with your actual privacy policy URL

                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch privacy policy';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
