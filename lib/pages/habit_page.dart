import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/delete_alert_dialog.dart';
import 'package:habit_tracker_app/widgets/edit_habit_goal_alert_dialog.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({super.key});

  @override
  State<HabitPage> createState() => _HabitPageState();
}

class _HabitPageState extends State<HabitPage> {
  List<bool> isSelectedList = List.generate(10, (_) => false);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Habits',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: isSelectedList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: isSelectedList[index]
                        ? Colors.white
                        : Colors.orange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelectedList[index] =
                            !isSelectedList[index]; // Toggle selection
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0, // Remove the shadow
                      shadowColor:
                          Colors.transparent, // Set shadow color to transparent
                      backgroundColor:
                          Colors.transparent, // Keep button transparent
                      padding: EdgeInsets.all(8),
                    ).copyWith(splashFactory: NoSplash.splashFactory),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                            color: isSelectedList[index]
                                ? Colors.black
                                : Colors.deepOrange,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          'Mar',
                          style: TextStyle(
                            color: isSelectedList[index]
                                ? Colors.black
                                : Colors.orange,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Expanded(
              child: SingleChildScrollView(
                child: Container(
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
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Today Habit',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 580,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics:
                                const AlwaysScrollableScrollPhysics(), // Ensure scrolling

                            itemCount: isChecked.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
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
                                        padding:
                                            const EdgeInsets.only(left: 14.0),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
