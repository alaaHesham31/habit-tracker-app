import 'package:flutter/material.dart';

class EditHabitGoalAlertDialog extends StatefulWidget {
  const EditHabitGoalAlertDialog({super.key});

  @override
  State<EditHabitGoalAlertDialog> createState() =>
      _EditHabitGoalAlertDialogState();
}

class _EditHabitGoalAlertDialogState extends State<EditHabitGoalAlertDialog> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // Set border radius to zero
      ),
      title: Column(
        children: [
          Row(
            children: [
              const Text(
                'Edit Habit Goal',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const Divider(thickness: 1),
        ],
      ),
      // Wrap the content in a Container to set width and height
      content: Container(
        width: 300, // Set your desired width
        height: 400, // Set your desired height

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your Goal'),
            const SizedBox(height: 10),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
            const Text('Habit Name'),
            const SizedBox(
                height:
                    10), // Add some space between the text and the TextField
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                const Text('Period'),
                Spacer(), // Add some space between the text and the TextField
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4), // Background color
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8), // Padding
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
           const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Habit Type'),
               const Spacer(), 
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4), // Background color
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8), // Padding
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
           const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 8),
                  ),
                  onPressed: () {
                    // Add your button's onPressed functionality here
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white), // Ensure white text for contrast
                  ),
                ),
              ),
            ),
           const SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
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
                ).copyWith(splashFactory: NoSplash.splashFactory),
                onPressed: () {
                  // Add your button's onPressed functionality here

                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancle',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black), // Ensure white text for contrast
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
