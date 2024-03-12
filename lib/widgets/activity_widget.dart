
import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.trail,
    required this.color,
  });
  final String title;
  final String subTitle;
  final String trail;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.circle,
        color: color,
        size: 50,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      trailing: Text(
        trail,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}

