import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChallengeHomePage(),
    );
  }
}

class ChallengeHomePage extends StatelessWidget {
  final List<String> challenges = [
    "Reflect and set goals Write down the reasons you want to overcome your addiction and set clear, achievable goals for yourself.",
    "Seek support. Reach out to a support group, counselor, or trusted friend/family member who can provide guidance and encouragement throughout your journey.",
    "Create a healthy routine. Establish a daily routine that includes activities like exercise, meditation, healthy meals, and hobbies to replace old habits.",
    "Identify triggers. Recognize situations, people, or emotions that trigger your addictive behavior. Develop strategies to avoid or cope with them effectively.",
    "Educate yourself. Learn about the physiological and psychological effects of addiction. Understanding the science behind it can help you overcome it.",
    "Practice mindfulness. Engage in mindfulness exercises or meditation to increase self-awareness and reduce stress.",
    "Build a support network. Surround yourself with positive influences and individuals who support your recovery.",
    "Create a distraction list. Write down activities you can do when cravings strike. Keep this list handy for quick reference.",
    "Assess your environment. Remove any items or reminders associated with your addiction from your living space.",
    "Explore healthy coping mechanisms. Find healthy ways to deal with stress, such as exercise, journaling, art, or listening to music.",
    "Take care of your physical health. Ensure you're getting enough sleep, eating nutritious meals, and staying hydrated.",
    "Practice gratitude. Write down three things you're grateful for each day to cultivate a positive mindset.",
    "Set boundaries. Establish clear boundaries with people who enable or encourage your addictive behavior.",
    "Express yourself. Find healthy outlets to express your emotions, such as talking to a therapist, journaling, or engaging in creative activities.",
    "Celebrate small victories. Acknowledge and reward yourself for each milestone achieved on your journey.",
    "Learn from setbacks. If you experience a relapse or setback, remember it's a part of the recovery process. Identify triggers and adjust your strategies accordingly.",
    "Engage in physical activities. Exercise releases endorphins, improves mood, and reduces cravings. Find an activity you enjoy and make it a regular part of your routine.",
    "Practice self-compassion. Treat yourself with kindness and understanding. Remember that recovery takes time and effort.",
    "Develop a support system. Attend support group meetings, join online forums, or connect with individuals who have successfully overcome addiction.",
    "Focus on personal growth. Engage in activities that promote personal development and enhance your self-esteem.",
    "Get professional help. If needed, seek guidance from addiction specialists or therapists who can provide professional support.",
    "Embrace healthy habits. Replace old habits with new, healthy ones that contribute to your overall well-being.",
    "Avoid triggers. Stay away from environments, situations, or people that might tempt you to relapse.",
    "Practice stress management. Learn and implement stress-management techniques like deep breathing, yoga, or taking regular breaks.",
    "Find a hobby. Discover a new hobby or revive an old one to keep yourself occupied and engaged.",
    "Volunteer. Help others in need, as it can provide a sense of purpose and fulfillment.",
    "Practice self-reflection. Take time to journal or meditate on your journey, your progress, and the changes you've experienced so far.",
    "Practice self-care. Engage in activities that nurture your physical, mental, and emotional well-being, such as taking a relaxing bath, getting a massage, or practicing self-care rituals.",
    "Celebrate milestones. Take a moment to celebrate your achievements and the progress you've made in your addiction-free journey. Treat yourself to something special or spend quality time with loved ones who have supported you.",
    "Create a relapse prevention plan. Develop a plan to maintain your sobriety beyond the 30-day challenge. Identify potential triggers, establish strategies to overcome cravings, and outline a support system to rely on in times of need."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Text(
                '30 Day Addiction Relief Challenge',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                "Congratulations on taking the courageous step to overcome your addiction! The following is a 30-day challenge designed to help you break free from your addiction and build a healthier, happier life. Remember, it's important to consult with professionals and seek support from loved ones during this journey. Take it one day at a time and stay committed to your recovery.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Challenges:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              for (int i = 0; i < challenges.length; i++)
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: ListTile(
                    title: Text(
                      'Day ${i + 1}:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(challenges[i]),
                  ),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChallengeDetailsPage(challenges: challenges),
                    ),
                  );
                },
                child: Text('Start Challenge'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[500], // Change the button color to DeepPurple
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChallengeDetailsPage extends StatefulWidget {
  final List<String> challenges;

  ChallengeDetailsPage({required this.challenges});

  @override
  _ChallengeDetailsPageState createState() => _ChallengeDetailsPageState();
}

class _ChallengeDetailsPageState extends State<ChallengeDetailsPage> {
  int currentDay = 1;
  String summary = '';
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/florian-olivo-CY8PD-QOc_U-unsplash.jpg'), // Replace with your own background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Day $currentDay Challenge',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.challenges[currentDay - 1],
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Summary:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70
                ),
              ),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  setState(() {
                    summary = value;
                    isCompleted = summary.isNotEmpty;
                  });
                },
                maxLines: 5,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Write a summary of your experience...',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: isCompleted ? () {
                  if (currentDay < widget.challenges.length) {
                    setState(() {
                      currentDay++;
                      summary = '';
                      isCompleted = false;
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text('You have completed all the challenges.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                } : null,
                child: Text(
                  'Complete',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[500], // Change the button color to DeepPurple
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



