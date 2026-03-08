class DailyMantra {
  final String day;
  final String mantra;
  final int count;
  final String time;     // "07:00"
  final bool completed;  // checkbox

  DailyMantra({
    required this.day,
    required this.mantra,
    required this.count,
    required this.time,
    required this.completed,
  });
}