import 'package:flutter/material.dart';
import '../../../../const/colors.dart';
import '../../../../widgets/custom_text.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final bool? booleanValue;
  const ProfileButton({super.key, required this.title, this.booleanValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      margin: const EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: booleanValue != null ? redColor : blackColor,
          width: 1,
        ),
      ),
      child: Center(
        child: CustomText(
          text: title,
          size: 14,
          color: booleanValue != null ? redColor : blackColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
