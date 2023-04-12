import 'package:flutter/material.dart';
import '../../../../const/colors.dart';
import '../../../../widgets/custom_text.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: blackColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const CustomText(
            text: "Name",
            size: 14,
            color: blackColor,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Cannot be empty',
              ),
              controller: TextEditingController(text: 'Jenny'),
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: lightGreyColor, // change text color here
              ),
            ),
          ),
        ],
      ),
    );
  }
}
