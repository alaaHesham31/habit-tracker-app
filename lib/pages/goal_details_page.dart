import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/date_range_calender_widget.dart';
import 'package:habit_tracker_app/widgets/goal_details_widget.dart';

class GoalDetailsPage extends StatelessWidget {
  const GoalDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 30, // Increase the size of the back arrow icon
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        centerTitle: true, // Center the title in the AppBar
        title: const Text(
          'Goal: Journaling Everyday',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            children: [
              DateRangeCalendar(),
              const SizedBox(height: 20),
              const GoalDetailsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
