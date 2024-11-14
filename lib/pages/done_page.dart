import 'package:flutter/material.dart';
import 'package:habit_tracker_app/pages/home_page.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Stack(
              children: [
                Image(
                  image: AssetImage('assets/images/note.png'),
                ),
                Positioned(
                  top: 71,
                  right: 115,
                  child: Image(
                    image: AssetImage('assets/images/checkbox-circle-fill.png'),
                  ),
                ),
              ],
            ),
            const Text(
              'Done!',
              style: TextStyle(fontSize: 36),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'New Habit Goal has added',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Let\'s do the best to achieve your goal!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            Container(
              width: 300,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFA726), // Light Orange
                    Color(0xFFFF5722), // Dark Orange
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(4), // Rectangle shape
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.transparent, // Transparent button background
                  shadowColor:
                      Colors.transparent, // Removes shadow for cleaner look
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                ),
                onPressed: () {
                  // Add your button's onPressed functionality here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()),
                      );
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white), // Ensure white text for contrast
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
