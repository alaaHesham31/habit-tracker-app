import 'package:flutter/material.dart';
import 'package:habit_tracker_app/pages/habit_page.dart';
import 'package:habit_tracker_app/widgets/delete_alert_dialog.dart';
import 'package:habit_tracker_app/widgets/edit_habit_goal_alert_dialog.dart';
import 'package:habit_tracker_app/widgets/gradient_text.dart';

class TodayHabitWidget extends StatefulWidget {
  const TodayHabitWidget({super.key});

  @override
  State<TodayHabitWidget> createState() => _TodayHabitWidgetState();
}

class _TodayHabitWidgetState extends State<TodayHabitWidget> {
  List<bool> isChecked = [false, false];
  
    void _onMenuItemSelected(String value, int index) {
    switch (value) {
      case 'edit':
        showDialog(
        context: context,
        builder: (BuildContext context) {
          return const EditHabitGoalAlertDialog();
        },
      );
        break;
      case 'delete':
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const DeleteAlertDialog();
        },
      );
        // Handle delete action here
        setState(() {
          isChecked[index] = false; // Example: uncheck or remove habit
        });
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: Container(
        height: 300,
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
          padding: const EdgeInsets.only(top: 10.0, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Today Habit',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HabitPage()),
                      );
                    },
                    child: GradientText(text: 'See all', fontSize: 16)
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: isChecked.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: isChecked[index]
                            ? Colors.green.withOpacity(0.2)
                            : Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Text(
                              'Meditation',
                              style: TextStyle(
                                  color: isChecked[index]
                                      ? Colors.green
                                      : Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                          const Spacer(),
                          Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                activeColor: Colors.green,
                                value: isChecked[index],
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isChecked[index] = newValue!;
                                  });
                                },
                              )),
                          PopupMenuButton<String>(
                                    icon: const Icon(Icons.more_vert),
                                    onSelected: (value) {
                                      _onMenuItemSelected(value, index);
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return [
                                        const PopupMenuItem<String>(
                                          value: 'edit',
                                          child: Text('Edit'),
                                        ),
                                        const PopupMenuItem<String>(
                                          value: 'delete',
                                          child: Text('Delete'),
                                        ),
                                      ];
                                    },
                                  ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
