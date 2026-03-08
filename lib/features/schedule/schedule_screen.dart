import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  String selectedDay = "Monday";
  String mantra = "";
  int count = 21;
  TimeOfDay time = const TimeOfDay(hour: 7, minute: 0);

  final days = [
    "Monday","Tuesday","Wednesday","Thursday",
    "Friday","Saturday","Sunday"
  ];

  final controller = TextEditingController();

  void saveSchedule() {

    final box = Hive.box('daily_schedule');

    box.add({
      "day": selectedDay,
      "mantra": mantra,
      "count": count,
      "time": "${time.hour}:${time.minute}",
      "completed": false
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Manage Schedule")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            DropdownButton(
              value: selectedDay,
              items: days.map((d){
                return DropdownMenuItem(
                  value: d,
                  child: Text(d),
                );
              }).toList(),
              onChanged: (v){
                setState(() {
                  selectedDay = v!;
                });
              },
            ),

            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Mantra",
              ),
              onChanged: (v){
                mantra = v;
              },
            ),

            TextField(
              decoration: const InputDecoration(
                labelText: "Count",
              ),
              keyboardType: TextInputType.number,
              onChanged: (v){
                count = int.tryParse(v) ?? 21;
              },
            ),

            const SizedBox(height:20),

            ElevatedButton(
              child: const Text("Select Time"),
              onPressed: () async {

                final t = await showTimePicker(
                  context: context,
                  initialTime: time,
                );

                if(t!=null){
                  setState(() {
                    time = t;
                  });
                }

              },
            ),

            const SizedBox(height:20),

            ElevatedButton(
              onPressed: saveSchedule,
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}