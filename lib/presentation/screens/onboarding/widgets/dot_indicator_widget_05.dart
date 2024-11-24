import 'package:flutter/material.dart';

class DotIndicatorWidget05 extends StatelessWidget {
  final bool isActive;

  const DotIndicatorWidget05({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 32,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isActive
              ? Theme.of(context).unselectedWidgetColor
              : Theme.of(context).highlightColor,
        ),
      ),
    );
  }
}
