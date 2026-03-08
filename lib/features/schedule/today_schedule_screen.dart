import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../session/counter_screen.dart';

class TodayScheduleScreen extends StatefulWidget {
  const TodayScheduleScreen({super.key});

  @override
  State<TodayScheduleScreen> createState() => _TodayScheduleScreenState();
}

class _TodayScheduleScreenState extends State<TodayScheduleScreen> {

  late Box box;

  String today = "";

  @override
  void initState() {
    super.initState();

    box = Hive.box('daily_schedule');

    final weekday = DateTime.now().weekday;

    const days = [
      "",
      "Monday","Tuesday","Wednesday",
      "Thursday","Friday","Saturday","Sunday"
    ];

    today = days[weekday];
  }

  @override
  Widget build(BuildContext context) {

    final items = box.values
        .where((e) => e["day"] == today)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Jaap ($today)"),
      ),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){

          final item = items[index];

          return CheckboxListTile(

            title: Text(item["mantra"]),
            subtitle: Text("${item["count"]} times  ⏰ ${item["time"]}"),

            value: item["completed"],

            onChanged: (v){

              final updated = Map<String,dynamic>.from(item);
              updated["completed"] = v;

              box.putAt(index, updated);

              setState(() {});
            },

            secondary: IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>CounterScreen(
                      mantra: item["mantra"],
                      targetCount: item["count"],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}