import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../session/count_screen.dart';
import 'add_mantra_screen.dart';

class MantraScreen extends StatefulWidget {
  const MantraScreen({super.key});

  @override
  State<MantraScreen> createState() => _MantraScreenState();
}

class _MantraScreenState extends State<MantraScreen> {

  late Box<String> mantraBox;
  List<String> mantras = [];

  @override
  void initState() {
    super.initState();

    mantraBox = Hive.box<String>('mantras');

    // Add default mantras only if database is empty
    if (mantraBox.isEmpty) {
      mantraBox.addAll([
        "Om Namah Shivaya",
        "Gayatri Mantra",
        "Om Hrim Surya Namah",
      ]);
    }

    mantras = mantraBox.values.toList();
  }

  void addMantra() async {
    final newMantra = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddMantraScreen(),
      ),
    );

    if (newMantra != null && newMantra is String) {

      mantraBox.add(newMantra);

      setState(() {
        mantras = mantraBox.values.toList();
      });
    }
  }

  void deleteMantra(int index) {
    mantraBox.deleteAt(index);

    setState(() {
      mantras = mantraBox.values.toList();
    });
  }

  void confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Mantra"),
          content: const Text("Do you want to delete this mantra?"),
          actions: [

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),

            TextButton(
              onPressed: () {
                deleteMantra(index);
                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Mantra"),
      ),

      body: ListView.builder(
        itemCount: mantras.length,
        itemBuilder: (context, index) {

          return ListTile(
            title: Text(mantras[index]),

            // arrow icon
            leading: const Icon(Icons.self_improvement),

            // delete button
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                confirmDelete(index);
              },
            ),

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

      floatingActionButton: FloatingActionButton(
        onPressed: addMantra,
        child: const Icon(Icons.add),
      ),
    );
  }
}