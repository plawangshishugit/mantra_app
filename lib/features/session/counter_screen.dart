import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CounterScreen extends StatefulWidget {
  final String mantra;
  final int targetCount;

  const CounterScreen({
    super.key,
    required this.mantra,
    required this.targetCount,
  });

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int currentCount = 0;
  final AudioPlayer _audioPlayer = AudioPlayer(); 
  void incrementCounter() async {
    setState(() {
      if (currentCount < widget.targetCount) {
        currentCount++;
      }
    });

    if (currentCount == widget.targetCount) {
      print("Playing bell ...");

      try {
        await _audioPlayer.play(AssetSource('sounds/bell.wav'));
      } catch (e) {
        print("Audio error: $e");
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Japa Completed! 🕉"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mantra),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: incrementCounter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$currentCount / ${widget.targetCount}",
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Tap Anywhere to Count",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}