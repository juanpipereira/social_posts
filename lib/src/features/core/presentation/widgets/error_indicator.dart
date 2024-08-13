import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator(
    this.description, {
    super.key,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sorry!',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
