import 'package:flutter/material.dart';
import '../mantra/mantra_screen.dart';
import '../schedule/today_schedule_screen.dart';
import '../schedule/schedule_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jaap Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              child: const Text("Start Session"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MantraScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Today's Jaap"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodayScheduleScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Manage Schedule"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScheduleScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}