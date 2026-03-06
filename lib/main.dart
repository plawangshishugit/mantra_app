import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'features/mantra/mantra_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MantraApp());
}

class MantraApp extends StatelessWidget {
  const MantraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MantraFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MantraScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MantraFlow"),
      ),
      body: const Center(
        child: Text(
          "Firebase Connected Successfully",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}