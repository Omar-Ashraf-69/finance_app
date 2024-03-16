import 'package:flutter/material.dart';

class AddingDetailsContainerWidget extends StatelessWidget {
  const AddingDetailsContainerWidget({
    super.key,
    required this.color,
    required this.widget,
  });
  final Color color;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 12,
      ),
      child: widget,
    );
  }
}
