import 'package:flutter/material.dart';
import 'package:project_one/theme/pallete.dart';

class RoundedSmallButton extends StatelessWidget {
  final VoidCallback ontap;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  const RoundedSmallButton({
    super.key,
    required this.ontap,
    required this.label,
    this.backgroundColor = Pallete.whiteColor,
    this.textColor = Pallete.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
