import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/complete_delete_alert_dialod.dart';

class DeleteAlertDialog extends StatefulWidget {
  const DeleteAlertDialog({super.key});

  @override
  State<DeleteAlertDialog> createState() => _DeleteAlertDialogState();
}

class _DeleteAlertDialogState extends State<DeleteAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              size: 18,
            ),
          ),
          const Divider(thickness: 1),
        ],
      ),
      content: Container(
        width: 300,
        height: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.delete_outline,
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'Are you sure want to delete?',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFA726),
                    Color(0xFFFF5722),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                ),
                onPressed: () {
                  // Close current dialog and show the CompleteDeleteAlertDialog
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (context) => const CompleteDeleteAlertDialod(),
                  );
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                ).copyWith(splashFactory: NoSplash.splashFactory),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
