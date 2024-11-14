import 'package:flutter/material.dart';

class AccountSettingsPage extends StatefulWidget {
  
  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  // Variables to control editability of each field
  bool isNameEditable = false;
  bool isEmailEditable = false;
  bool isPasswordEditable = false;
  bool isConfirmPasswordEditable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name Label and Field
            Text(
              'Name',
              style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              initialValue: "Susy",
              readOnly: !isNameEditable,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isNameEditable = !isNameEditable;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Email Label and Field
            Text(
              'Email',
              style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              initialValue: "examplemail@mail.com",
              readOnly: !isEmailEditable,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEmailEditable = !isEmailEditable;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Password Label and Field
            Text(
              'Password',
              style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              obscureText: true,
              readOnly: !isPasswordEditable,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(isPasswordEditable
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isPasswordEditable = !isPasswordEditable;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Password Confirmation Label and Field
            Text(
              'Password Confirmation',
              style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              obscureText: true,
              readOnly: !isConfirmPasswordEditable,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(isConfirmPasswordEditable
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordEditable = !isConfirmPasswordEditable;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 32),

            // Update Button
           Container(
            width: double.infinity,
            decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFA726), // Light Orange
                      Color(0xFFFF5722), // Dark Orange
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    // Add update logic here
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                    child: Center(
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
           )
          ],
        ),
      ),
    );
  }
}
