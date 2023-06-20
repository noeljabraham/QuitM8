import 'package:flutter/material.dart';
import 'dart:math';

class Motivation extends StatefulWidget {
  const Motivation({Key? key}) : super(key: key);

  @override
  State<Motivation> createState() => _MotivationState();
}

class _MotivationState extends State<Motivation> {
  List<String> motivationalQuotes = [
    "Believe you can and you're halfway there. - Theodore Roosevelt",
    "The only way to do great work is to love what you do. - Steve Jobs",
    "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
    "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
    "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
    // Add more motivational quotes here
  ];

  @override
  void initState() {
    super.initState();
    setGoals();
  }

  void setGoals() {
    // Set meaningful and achievable goals
  }

  String getRandomMotivationalQuote() {
    final random = Random();
    final index = random.nextInt(motivationalQuotes.length);
    return motivationalQuotes[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[800],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Daily Inspirational Content',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      getRandomMotivationalQuote(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Challenges',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ChallengeTile(
                      title: 'Challenge 1',
                      description: '30-day challenge for addiction relief',
                      color: Colors.blue,
                      icon: 'images/download-removebg-preview.png',
                      onTap: () {
                        // Add desired functionality for Challenge 1
                      },
                    ),
                    SizedBox(height: 10),
                    ChallengeTile(
                      title: 'Challenge 2',
                      description: '30-day challenge for addiction relief',
                      color: Colors.orange,
                      icon: 'images/Motivation5-removebg-preview.png',
                      onTap: () {
                        // Add desired functionality for Challenge 2
                      },
                    ),
                    SizedBox(height: 10),
                    ChallengeTile(
                      title: 'Challenge 3',
                      description: '30-day challenge for addiction relief',
                      color: Colors.green,
                      icon: 'images/Motivation3.png',
                      onTap: () {
                        // Add desired functionality for Challenge 3
                      },
                    ),
                    SizedBox(height: 10),
                    ChallengeTile(
                      title: 'Custom Challenge',
                      description: 'Create your own 30-day challenge',
                      color: Colors.purple,
                      icon: 'images/Motivation5-removebg-preview.png',
                      onTap: () {
                        // Add desired functionality for Custom Challenge
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChallengeTile extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final String icon;
  final VoidCallback onTap;

  const ChallengeTile({
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                icon,
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Motivation(),
  ));
}
