import 'package:flutter/material.dart';
import 'counter_screen.dart';

class CountScreen extends StatelessWidget {
  final String mantra;

  const CountScreen({super.key, required this.mantra});

  @override
  Widget build(BuildContext context) {
    final counts = [11, 21, 51, 108, "Custom"];

    return Scaffold(
      appBar: AppBar(
        title: Text(mantra),
      ),
      body: ListView.builder(
        itemCount: counts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              counts[index] == "Custom"
                  ? "Custom Count"
                  : "${counts[index]} times",
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async {
              final selected = counts[index];

              if (selected == "Custom") {
                TextEditingController controller = TextEditingController();

                final customCount = await showDialog<int>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Enter Custom Count"),
                      content: TextField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Enter number of chants",
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            int value = int.tryParse(controller.text) ?? 0;
                            Navigator.pop(context, value);
                          },
                          child: const Text("Start"),
                        ),
                      ],
                    );
                  },
                );

                if (customCount != null && customCount > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CounterScreen(
                        mantra: mantra,
                        targetCount: customCount,
                      ),
                    ),
                  );
                }
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CounterScreen(
                      mantra: mantra,
                      targetCount: selected as int,
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}