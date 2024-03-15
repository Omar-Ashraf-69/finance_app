import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.trail,
    required this.color, this.onDismissed,
  });
  final String title;
  final String subTitle;
  final String trail;
  final Color color;
  final void Function(DismissDirection)? onDismissed;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.only(left: 20),
        color: color,
        child: const Align(
            alignment: Alignment.centerLeft, child: Icon(Icons.edit)),
      ),
      secondaryBackground: Container(
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Align(
            alignment: Alignment.centerRight, child: Icon(Icons.delete)),
      ),
      onDismissed: onDismissed ,
      
      child: ListTile(
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
      ),
    );
  }
}
