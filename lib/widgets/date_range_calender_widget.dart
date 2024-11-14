import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateRangeCalendar extends StatefulWidget {
  const DateRangeCalendar({super.key});
  @override
  DateRangeCalendarState createState() => DateRangeCalendarState();
}

class DateRangeCalendarState extends State<DateRangeCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('Start date', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      _rangeStart != null ? '${_rangeStart!.toLocal()}'.split(' ')[0] : 'Select',
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('End date', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      _rangeEnd != null ? '${_rangeEnd!.toLocal()}'.split(' ')[0] : 'Select',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            TableCalendar(
              firstDay: DateTime.utc(2022, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                if (_rangeStart != null && _rangeEnd != null) {
                  return day.isAfter(_rangeStart!) && day.isBefore(_rangeEnd!);
                }
                return false;
              },
              rangeSelectionMode: RangeSelectionMode.enforced,
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                  if (_rangeStart == null || (_rangeStart != null && _rangeEnd != null)) {
                    _rangeStart = selectedDay;
                    _rangeEnd = null;
                  } else {
                    _rangeEnd = selectedDay.isAfter(_rangeStart!)
                        ? selectedDay
                        : _rangeStart;
                  }
                });
              },
              onRangeSelected: (start, end, focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                  _rangeStart = start;
                  _rangeEnd = end;
                });
              },
              calendarStyle: CalendarStyle(
                rangeHighlightColor: Colors.greenAccent.withOpacity(0.3),
                rangeStartDecoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
                rangeEndDecoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
                todayDecoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
