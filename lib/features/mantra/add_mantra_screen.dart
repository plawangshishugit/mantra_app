import 'package:flutter/material.dart';

class AddMantraScreen extends StatefulWidget {
  const AddMantraScreen({super.key});

  @override
  State<AddMantraScreen> createState() => _AddMantraScreenState();
}

class _AddMantraScreenState extends State<AddMantraScreen> {
  final TextEditingController controller = TextEditingController();

  void saveMantra() {
    final mantra = controller.text.trim();

    if (mantra.isNotEmpty) {
      Navigator.pop(context, mantra);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Mantra"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Enter Mantra",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveMantra,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}