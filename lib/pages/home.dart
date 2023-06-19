import 'package:flutter/material.dart';
import 'package:quitm8/screens/addiction_options_page.dart';
import 'package:quitm8/pages/community.dart';
import 'package:quitm8/pages/motivation.dart';
import 'package:quitm8/pages/profile.dart';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  late DateTime startDate;
  double progressPercentage = 0.0;
  int _selectedIndex = 0;
  List<String> addictionList = [];

  double progress = 0.0;
  int totalTimeInSeconds = 86400; // 24 hours in seconds
  DateTime startTime = DateTime.now();

  void _onPlusPressed(BuildContext context) async {
    final result =
        await Navigator.pushNamed(context, AddictionOptionsPage.routeName);
    if (result != null) {
      setState(() {
        addictionList.add(result as String);
      });
    }
  }

  @override

  void initState() {
    super.initState();
    startDate = DateTime.now();
    updateProgress();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      final currentTime = DateTime.now();
      final elapsedTimeInSeconds = currentTime.difference(startTime).inSeconds;
      setState(() {
        progress = elapsedTimeInSeconds / totalTimeInSeconds;
        if (elapsedTimeInSeconds >= totalTimeInSeconds) {
          startTime = DateTime.now();
        }
      });
    });
  }

  void updateProgress() {
    DateTime currentDate = DateTime.now();
    DateTime nextDay = startDate.add(const Duration(days: 1));

    if (currentDate.isAfter(nextDay)) {
      setState(() {
        progressPercentage = 100.0;
      });
    } else {
      Duration elapsedTime = currentDate.difference(startDate);
      double secondsPassed = elapsedTime.inSeconds.toDouble();
      double secondsPerDay = Duration(days: 1).inSeconds.toDouble();
      setState(() {
        progressPercentage = (secondsPassed / secondsPerDay) * 100;
      });
      Future.delayed(Duration(seconds: 1), updateProgress);
    }
  }

  String formatTime(int seconds) {
    final days = seconds ~/ 86400;
    final hours = (seconds % 86400) ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${days.toString().padLeft(2, '0')} Days ${hours.toString().padLeft(2, '0')}h:${minutes.toString().padLeft(2, '0')}m:${remainingSeconds.toString().padLeft(2, '0')}s';
  }

  Widget _buildHomeContent() {
    return Column(
      children: [
        SizedBox(height: 16),
        GestureDetector(
          onTap: () => _onPlusPressed(context),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 100,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Stay strong and break free from addiction!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            itemCount: addictionList.length,
            itemBuilder: (context, index) {
              String addictionText = addictionList[index];
              if (addictionText.isNotEmpty) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom:120.0), // space between addiction type and progress abr
                        child: Center(
                          child: Text(
                            'Addiction Type : $addictionText',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:100.0),
                          child: Center(
                            child : Transform.scale(scale: 4.0, // size of circularprogressindicator
                            child : CircularProgressIndicator(
                              value: progressPercentage / 100,
                              valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
                              backgroundColor: Colors.purple[200],
                              strokeWidth: 5,
                            ),
                            ),
                          ),
                        ),
                      Center(
                        child: Text(
                          'Abstinence Time:\n ${formatTime(DateTime.now().difference(startTime).inSeconds)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(

                        width: double.infinity,
                        height: 30,
                        //color: Colors.grey[300],
                      ),
                    ],
                  ),
                );
              } else {
                return SizedBox.shrink(); // Empty container
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return _buildHomeContent();
      case 1:
        return CommunityPage();
      case 2:
        return Motivation();
      case 3:
        return Profile();
      default:
        return _buildHomeContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    final elapsedTimeInSeconds = DateTime.now().difference(startTime).inSeconds;
    final formattedTime = formatTime(elapsedTimeInSeconds);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 5.0),
                    child: Text(
                      'QuitM8',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: _buildPage(_selectedIndex),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
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
    );
  }
}
