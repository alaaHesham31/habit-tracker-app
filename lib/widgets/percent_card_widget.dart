import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentCardWidget extends StatelessWidget {
  const PercentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFFFA726), // Light Orange
                              Color(0xFFFF5722), // Dark Orange
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 13.0,
                              animation: true,
                              percent: 0.7,
                              progressColor: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 212, 210, 209),
                              center: const Text(
                                "70.0%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white),
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '3 of 5 habits',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                                Text(
                                  'Completed today!',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        bottom: -30,
                        left: 240,
                        child: Image(
                          image: AssetImage('assets/images/Calendar.png'),
                        ),
                      ),
                    ],
                  ),
                );
  }
}