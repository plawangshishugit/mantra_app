import 'package:flutter/material.dart';
import '../session/count_screen.dart';

class MantraScreen extends StatelessWidget {
  const MantraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mantras = [
      "Om Namah Shivaya",
      "Gayatri Mantra",
      "Om Hrim Surya Namah",
      "Custom Mantra"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Mantra"),
      ),
      body: ListView.builder(
        itemCount: mantras.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(mantras[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountScreen(
                    mantra: mantras[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}