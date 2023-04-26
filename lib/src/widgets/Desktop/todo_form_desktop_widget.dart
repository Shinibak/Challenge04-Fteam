import 'package:flutter/material.dart';

class TodoFormDesktopWidget extends StatelessWidget {
  const TodoFormDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.red,
      content: SizedBox(
        height: 120,
      ),
    );
  }
}
