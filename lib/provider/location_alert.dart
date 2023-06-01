import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocationAlert extends StatefulWidget {
  @override
  _LocationAlertState createState() => _LocationAlertState();
}

class _LocationAlertState extends State<LocationAlert> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Position? _currentPosition;
  StreamSubscription<Position>? _positionStreamSubscription;

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _startLocationTracking();
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  void _initializeNotifications() {
    // Initialize the notification plugin
    // See the flutter_local_notifications package documentation for details
  }

  void _startLocationTracking() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      // Request permission if not granted
      if (await Geolocator.checkPermission() == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }

      _positionStreamSubscription = Geolocator.getPositionStream().listen(
        (Position position) async {
          setState(() {
            _currentPosition = position;
          });

          // Check if the user is near a monitored place
          await _checkNearbyPlaces();
        },
      );
    }
  }

  Future<void> _checkNearbyPlaces() async {
    if (_currentPosition == null) return;

    // Query the Firestore collection to get all monitored places
    QuerySnapshot querySnapshot = await _firestore.collection('places').get();

    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      double placeLatitude = document['latitude'];
      double placeLongitude = document['longitude'];

      double distanceInMeters = await Geolocator.distanceBetween(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
        placeLatitude,
        placeLongitude,
      );

      // Define your threshold distance here
      double thresholdDistance = 100; // in meters

      if (distanceInMeters <= thresholdDistance) {
        _vibrate();
        _showNotification();
        break; // Exit the loop if a nearby place is found
      }
    }
  }

  void _vibrate() {
    if (Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
  }

  void _showNotification() {
    // Use the flutter_local_notifications package to show a notification
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Alert'),
      ),
      body: Center(
        child: _currentPosition != null
            ? Text(
                'Latitude: ${_currentPosition!.latitude}\n'
                'Longitude: ${_currentPosition!.longitude}',
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
