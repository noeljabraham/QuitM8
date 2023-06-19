import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  int challengeProgress = 0;
  List<String> tasks = [
    'Day 1:REFLECT AND SET GOALS. Write down the reasons you want to overcome your addiction and set clear, achievable goals for yourself. ',
    'Day 2: Seek support. Reach out to a support group, counselor, or trusted friend/family member who can provide guidance and encouragement throughout your journey.',
    'Day 3: Create a healthy routine. Establish a daily routine that includes activities like exercise, meditation, healthy meals, and hobbies to replace old habits.',
    'Day 4: Identify triggers. Recognize situations, people, or emotions that trigger your addictive behavior. Develop strategies to avoid or cope with them effectively.',
    'Day 5: Educate yourself. Learn about the physiological and psychological effects of addiction. Understanding the science behind it can help you overcome it.',
    'Day 6: Practice mindfulness. Engage in mindfulness exercises or meditation to increase self-awareness and reduce stress.',
    'Day 7: Build a support network. Surround yourself with positive influences and individuals who support your recovery.',
    'Day 8: Create a distraction list. Write down activities you can do when cravings strike. Keep this list handy for quick reference.',
    'Day 9: Assess your environment. Remove any items or reminders associated with your addiction from your living space.',
    'Day 10: Explore healthy coping mechanisms. Find healthy ways to deal with stress, such as exercise, journaling, art, or listening to music.',
    'Day 11: Take care of your physical health. Ensure you are getting enough sleep, eating nutritious meals, and staying hydrated.',
    'Day 12: Practice gratitude. Write down three things you are grateful for each day to cultivate a positive mindset.',
    'Day 13: Set boundaries. Establish clear boundaries with people who enable or encourage your addictive behavior.',
    'Day 14: Express yourself. Find healthy outlets to express your emotions, such as talking to a therapist, journaling, or engaging in creative activities.',
    'Day 15: Celebrate small victories. Acknowledge and reward yourself for each milestone achieved on your journey.',
    "Day 16: Learn from setbacks. If you experience a relapse or setback, remember it's a part of the recovery process. Identify triggers and adjust your strategies accordingly.",
    'Day 17: Engage in physical activities. Exercise releases endorphins, improves mood, and reduces cravings. Find an activity you enjoy and make it a regular part of your routine.',
    'Day 18: Practice self-compassion. Treat yourself with kindness and understanding. Remember that recovery takes time and effort.',
    'Day 19: Develop a support system. Attend support group meetings, join online forums, or connect with individuals who have successfully overcome addiction.',
    'Day 20: Focus on personal growth. Engage in activities that promote personal development and enhance your self-esteem.',
    'Day 21: Get professional help. If needed, seek guidance from addiction specialists or therapists who can provide professional support.',
    'Day 22: Embrace healthy habits. Replace old habits with new, healthy ones that contribute to your overall well-being.',
    'Day 23: Avoid triggers. Stay away from environments, situations, or people that might tempt you to relapse.',
    'Day 24: Practice stress management. Learn and implement stress-management techniques like deep breathing, yoga, or taking regular breaks.',
    'Day 25: Find a hobby. Discover a new hobby or revive an old one to keep yourself occupied and engaged.',
    'Day 26: Volunteer. Help others in need, as it can provide a sense of purpose and fulfillment.',
    "Day 27: Practice self-reflection. Take time to journal or meditate on your journey, your progress, and the changes you've experienced so far.",
    'Day 28: Practice self-care. Engage in activities that nurture your physical, mental, and emotional well-being, such as taking a relaxing bath, getting a massage, or practicing self-care rituals.',
    "Day 29: Celebrate milestones. Take a moment to celebrate your achievements and the progress you've made in your addiction-free journey. Treat yourself to something special or spend quality time with loved ones who have supported you.",
    'Day 30: Create a relapse prevention plan. Develop a plan to maintain your sobriety beyond the 30-day challenge. Identify potential triggers, establish strategies to overcome cravings, and outline a support system to rely on in times of need.',
  ];

  void startChallenge() {
    setState(() {
      challengeProgress = 1;
    });
  }

  void completeChallenge() {
    if (challengeProgress < tasks.length) {
      setState(() {
        challengeProgress++;
      });
    } else {
      setState(() {
        challengeProgress = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('30-Day Challenge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (challengeProgress == 0)
              ElevatedButton(
                onPressed: startChallenge,
                child: const Text('Start Challenge'),
              ),
            if (challengeProgress > 0 && challengeProgress <= tasks.length)
              Column(
                children: [
                  Text('Day $challengeProgress of 30'),
                  const SizedBox(height: 16),
                  Text(
                    tasks[challengeProgress - 1],
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: completeChallenge,
                    child: Text('Complete Day $challengeProgress'),
                  ),
                ],
              ),
            if (challengeProgress > tasks.length)
              const Text(
                'Congratulations! Challenge Completed!',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}


void main() {
  runApp(const MaterialApp(
    home: ChallengePage(),
  ));
}
