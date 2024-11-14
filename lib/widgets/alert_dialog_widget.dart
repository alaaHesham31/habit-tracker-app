import 'package:flutter/material.dart';
import 'package:habit_tracker_app/pages/done_page.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({super.key});

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white, width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(6), // Set border radius to zero
                    ),
                    title: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Create New Habit Goal',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
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
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
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
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Text('Period'),
                            const  Spacer(), 
                              Container(
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.grey
                                      .withOpacity(0.4), // Background color
                                  borderRadius: BorderRadius.circular(
                                      4), // Rounded corners
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8), // Padding
                                child: DropdownButton<String>(
                                  value: selectedValue,
                                  hint: const Text('Select an option'),
                                  dropdownColor: const Color.fromARGB(255, 179,
                                      178, 178), // Dropdown background color
                                  isExpanded: true,
                                  underline:
                                      const SizedBox(), // Remove underline
                                  items: <String>[
                                    'Option 1',
                                    'Option 2',
                                    'Option 3'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
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
                             const Spacer(), // Add some space between the text and the TextField
                              Container(
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.grey
                                      .withOpacity(0.4), // Background color
                                  borderRadius: BorderRadius.circular(
                                      4), // Rounded corners
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8), // Padding
                                child: DropdownButton<String>(
                                  value: selectedValue,
                                  hint: const Text('Select an option'),
                                  dropdownColor: const Color.fromARGB(255, 179,
                                      178, 178), // Dropdown background color
                                  isExpanded: true,
                                  underline:
                                      const SizedBox(), // Remove underline
                                  items: <String>[
                                    'Option 1',
                                    'Option 2',
                                    'Option 3'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
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
                                borderRadius:
                                    BorderRadius.circular(4), // Rectangle shape
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .transparent, // Transparent button background
                                  shadowColor: Colors
                                      .transparent, // Removes shadow for cleaner look
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 8),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DonePage()),
                                  );
                                },
                                child: const Text(
                                  'Create New',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors
                                          .white), // Ensure white text for contrast
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          )),
    );
  }
}
