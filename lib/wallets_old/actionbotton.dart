import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const ActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,
            size: 40, color: color), // Icon with specified size and color.
        const SizedBox(height: 8), // Spacing between the icon and the label.
        Text(label), // Text label below the icon.
      ],
    );
  }
}
