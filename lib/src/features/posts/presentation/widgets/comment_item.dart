import 'package:flutter/material.dart';

import '../../domain/comment.dart';

class CommentItem extends StatelessWidget {
  const CommentItem(
    this.comment, {
    super.key,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.name,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            comment.email,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            comment.body,
            style: const TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
