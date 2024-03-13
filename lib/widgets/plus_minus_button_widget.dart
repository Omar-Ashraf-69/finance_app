import 'package:flutter/material.dart';

class PlusAndMinsButtonWidget extends StatelessWidget {
  const PlusAndMinsButtonWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.onTap,
  });
  final Color color;
  final Color iconColor;
  final IconData icon;
  final String label;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 22,
                color: iconColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
