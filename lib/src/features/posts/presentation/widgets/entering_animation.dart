import 'package:flutter/material.dart';

class EnteringAnimation extends StatelessWidget {
  const EnteringAnimation({
    super.key,
    required this.child,
  });

  final double _yOffset = 8.0;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ),
      duration: const Duration(milliseconds: 600),
      builder: (
        BuildContext context,
        double value,
        Widget? child,
      ) {
        return Transform.translate(
          offset: Offset(
            0.0,
            _yOffset - (_yOffset * value),
          ),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
