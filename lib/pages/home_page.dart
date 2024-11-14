import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:habit_tracker_app/pages/progress_page.dart';
import 'package:habit_tracker_app/pages/settings_page.dart';
import 'package:habit_tracker_app/widgets/alert_dialog_widget.dart';
import 'package:habit_tracker_app/widgets/goals_widget.dart';
import 'package:habit_tracker_app/widgets/gradient_text.dart';
import 'package:habit_tracker_app/widgets/percent_card_widget.dart';
import 'package:habit_tracker_app/widgets/today_habit_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(), 
    const ProgressPage(),
     SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], 
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTabChange: _onItemTapped,
      ),
    );
  }
}

// Bottom Navigation Bar widget for reusability and clean structure
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChange;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: GNav(
          onTabChange: onTabChange,
          padding: const EdgeInsets.all(16.0),
          gap: 20.0,
          backgroundColor: Colors.white,
          color: Colors.grey, // Color for inactive items (black)
          activeColor: Colors.orange.shade800, // Color for the active item (orange)
          tabBackgroundColor: Colors.transparent, // No background for tabs
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              iconColor: currentIndex == 0 ? Colors.orange.shade800 : Colors.grey,
              textColor: currentIndex == 0 ? Colors.orange.shade800 : Colors.grey,
            ),
            GButton(
              icon: Icons.bar_chart,
              text: 'Progress',
              iconColor: currentIndex == 1 ? Colors.orange.shade800 : Colors.grey,
              textColor: currentIndex == 1 ? Colors.orange.shade800 : Colors.grey,
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
              iconColor: currentIndex == 2 ? Colors.orange.shade800 : Colors.grey,
              textColor: currentIndex == 2 ? Colors.orange.shade800 : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}



// Custom widget for the home page content to keep it organized
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 40.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Thu, 24 Oct 2024',
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                         Text(
                          'Hello, ',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        GradientText(text: 'Suzy!', fontSize: 24),
                      ],
                    ),
                  ],
                ),
              ),
               PercentCardWidget(),
               TodayHabitWidget(),
               GoalsWidget(),
            ],
          ),
        ),
         Positioned(
          bottom: 15,
          right: 10,
          child: AlertDialogWidget(),
        ),
      ],
    );
  }
}
