
import 'package:finanice_app/widgets/adding_details_container_widget.dart';
import 'package:flutter/material.dart';

class DoneAndCancelButtonWidget extends StatelessWidget {
  const DoneAndCancelButtonWidget({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.label,
    this.value = '',
    this.onTap,
  });
  final Color textColor;
  final Color backgroundColor;
  final String label;
  final String value;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AddingDetailsContainerWidget(
          color: backgroundColor,
          widget: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
