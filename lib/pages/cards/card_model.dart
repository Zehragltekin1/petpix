import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const OptionCard({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade300,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
                fontSize: 18, color: Color.fromARGB(255, 12, 10, 8)),
          ),
        ),
      ),
    );
  }
}
