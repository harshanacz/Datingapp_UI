import 'package:datingapp_ui/screens/main/profile/widgets/clipper.dart';
import 'package:datingapp_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../const/colors.dart';

headerSection() {
  return Stack(
    children: [
      ClipPath(
        clipper: Customshape(),
        child: Container(
          color: pinkColor,
          height: 210,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: const NetworkImage(
                  "https://i.ibb.co/dkyqGxk/Untitled-design-2.png"),
              radius: 60,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: pinkColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const CustomText(
              text: "Jenny, 22",
              fontWeight: FontWeight.w600,
              size: 15,
            ),
          ],
        ),
      ),
    ],
  );
}
