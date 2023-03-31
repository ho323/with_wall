import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:with_wall/component/calendar.dart';
import 'package:with_wall/component/schedule_card.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  final db = FirebaseFirestore.instance;

  Future<void> getCollection() async {
    await db.collection("post").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              selectedDay: selectedDay,
              focusedDay: focusedDay,
              onDaySelected: onDaySelected,
            ),
            SizedBox(height: 8.0),
            // _ScheduleList(
            //   selectedDate: selectedDay,
            // ),
          ],
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay; // 다른 달 날짜 클릭하면 달 focus 변경
    });
  }
}

// class _ScheduleList extends StatelessWidget {
//   final DateTime selectedDate;
//
//   const _ScheduleList({
//     required this.selectedDate,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: StreamBuilder<List<ScheduleWithColor>>(
//             stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//
//               if (snapshot.hasData && snapshot.data!.isEmpty) {
//                 return const Center(
//                   child: Text('기록이 없습니다.'),
//                 );
//               }
//
//               return ListView.separated(
//                 itemCount: snapshot.data!.length,
//                 separatorBuilder: (context, index) {
//                   return SizedBox(height: 8.0);
//                 },
//                 itemBuilder: (context, index) {
//                   final scheduleWithColor = snapshot.data![index];
//
//                   return ScheduleCard(
//                     startTime: scheduleWithColor.schedule.startTime,
//                     endTime: scheduleWithColor.schedule.endTime,
//                     content: scheduleWithColor.schedule.content,
//                     color: Color(
//                       int.parse(
//                           'FF${scheduleWithColor.categoryColor.hexCode}',
//                           radix: 16),
//                     ),
//                   );
//                 },
//               );
//             }),
//       ),
//     );
//   }
// }