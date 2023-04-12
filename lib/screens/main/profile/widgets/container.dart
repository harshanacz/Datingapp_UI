import 'package:flutter/material.dart';
import '../../../../const/colors.dart';
import '../../../../widgets/custom_text.dart';

class ProfileContainer extends StatelessWidget {
  final String leading;
  final String value;
  final bool? booleanValue;
  const ProfileContainer(
      {super.key,
      required this.leading,
      required this.value,
      this.booleanValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      margin: const EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: blackColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          CustomText(
            text: leading,
            size: 14,
            color: blackColor,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CustomText(
              text: value,
              size: 14,
              color: booleanValue != null ? pinkColor : lightGreyColor,
              fontWeight:
                  booleanValue != null ? FontWeight.w600 : FontWeight.w500,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
