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
    // Get a random motivational quote
    final random = Random();
    final index = random.nextInt(motivationalQuotes.length);
    return motivationalQuotes[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motivation Page'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Container(
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
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: Container(
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
                    GestureDetector(
                      onTap: () {
                        // Navigate to Challenge 1 page
                      },
                      child: ChallengeTile(
                        title: 'Challenge 1',
                        description: '30-day challenge for addiction relief',
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Challenge 2 page
                      },
                      child: ChallengeTile(
                        title: 'Challenge 2',
                        description: '30-day challenge for addiction relief',
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Challenge 3 page
                      },
                      child: ChallengeTile(
                        title: 'Challenge 3',
                        description: '30-day challenge for addiction relief',
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Custom Challenge page
                      },
                      child: ChallengeTile(
                        title: 'Custom Challenge',
                        description: 'Create your own 30-day challenge',
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChallengeTile extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const ChallengeTile({
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Motivation(),
  ));
}
