import 'package:flutter/material.dart';
import 'package:habit_tracker_app/pages/goal_details_page.dart';
import 'package:habit_tracker_app/widgets/gradient_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Progress',
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Progress Report',
                    style: TextStyle(fontSize: 22),
                  ),
                  const Spacer(),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4), // Background color
                      borderRadius: BorderRadius.circular(4), // Rounded corners
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8), // Padding
                    child: DropdownButton<String>(
                      value: selectedValue,
                      hint: const Text('Select an option'),
                      dropdownColor: const Color.fromARGB(
                          255, 179, 178, 178), // Dropdown background color
                      isExpanded: true,
                      underline: const SizedBox(), // Remove underline
                      items: <String>['Option 1', 'Option 2', 'Option 3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 700,
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
                        const EdgeInsets.only(top: 12.0, left: 16, right: 16),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Your Goals',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            GradientText(text: 'See all', fontSize: 16)
                          ],
                        ),
                        const SizedBox(height: 40),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // Background circle
                            CircularPercentIndicator(
                              radius: 70.0,
                              lineWidth: 15.0,
                              percent: 1.0, // Full circle for background
                              progressColor: const Color.fromARGB(
                                  255, 212, 210, 209), // Background color
                            ),

                            // Gradient progress circle
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  colors: [
                                    Color(0xFFFFA726), // Light Orange
                                    Color(0xFFFF5722), // Dark Orange
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds);
                              },
                              child: CircularPercentIndicator(
                                radius: 70.0,
                                lineWidth: 15.0,
                                animation: true,
                                percent:
                                    0.7, // Set this to the desired percentage
                                progressColor: Colors
                                    .white, // Placeholder color, overwritten by ShaderMask
                                backgroundColor: Colors
                                    .transparent, // Transparent background so only gradient is visible
                                center: const Text(
                                  "70%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.orange,
                            ),
                            GradientText(
                                text: '11 Habits goal has achieved',
                                fontSize: 16),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),
                            Text(
                              '6 Habits goal hasn\'t achieved',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GoalDetailsPage()));
                          },
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 5.0,
                                    animation: true,
                                    percent: 1,
                                    progressColor: Colors.green,
                                    backgroundColor: const Color.fromARGB(
                                        255, 212, 210, 209),
                                    center: const Text(
                                      "100%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Colors.green),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Journaling Everyday',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '7 from 7 days target',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Achieved',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GoalDetailsPage()));
                          },
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 5.0,
                                    animation: true,
                                    percent: 0.7,
                                    progressColor: Colors.grey,
                                    backgroundColor: const Color.fromARGB(
                                        255, 212, 210, 209),
                                    center: const Text(
                                      "70%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Colors.grey),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Vaitamin',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '5 from 7 days target',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Unachieved',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
