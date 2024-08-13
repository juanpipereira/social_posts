import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    required this.isLiked,
    super.key,
    required this.onPressed,
  });

  final bool isLiked;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.red.shade100,
      icon: Icon(
        color: Colors.red,
        isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
      ),
      onPressed: onPressed,
    );
  }
}
