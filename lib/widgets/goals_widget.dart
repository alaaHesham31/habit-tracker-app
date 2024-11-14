import 'package:flutter/material.dart';
import 'package:habit_tracker_app/pages/goals_page.dart';
import 'package:habit_tracker_app/widgets/delete_alert_dialog.dart';
import 'package:habit_tracker_app/widgets/edit_habit_goal_alert_dialog.dart';
import 'package:habit_tracker_app/widgets/gradient_text.dart';

class GoalsWidget extends StatefulWidget {
  const GoalsWidget({super.key});

  @override
  State<GoalsWidget> createState() => _GoalsWidgetState();
}

class _GoalsWidgetState extends State<GoalsWidget> {
  double progressValue = 0.5;

  List<bool> isChecked = List.generate(10, (_) => false);

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
        height: 450,
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
                    'Your Goals',
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
                            builder: (context) => const GoalsPage()),
                      );
                    },
                    child:const GradientText(text: 'See all', fontSize: 16),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Finish 5 Books',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                const Spacer(),
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
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final width =
                                      constraints.maxWidth * progressValue;

                                  return Stack(
                                    children: [
                                      Container(
                                        height: 14,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      Container(
                                        height: 14,
                                        width: width,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFFFA726), // Light Orange
                                              Color(0xFFFF5722), // Dark Orange
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                '5 from 7 days target',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                           const Padding(
                              padding:  EdgeInsets.only(top: 8.0),
                              child: GradientText(
                                text: 'Everyday',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
