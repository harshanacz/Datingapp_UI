import 'package:datingapp_ui/screens/main/profile/widgets/button.dart';
import 'package:datingapp_ui/screens/main/profile/widgets/container.dart';
import 'package:datingapp_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import 'body_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: pinkColor,
        title: const CustomText(
          text: "Your Profile",
          fontWeight: FontWeight.w500,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //head section
            headerSection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // --------------- Account Settings
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(
                        text: "Account Settings",
                        size: 18,
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        text: "Edit",
                        size: 14,
                        color: pinkColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const ProfileContainer(leading: "Name", value: "Jenny"),
                  const ProfileContainer(
                      leading: "Phone Number", value: "+91 9876543210"),
                  const ProfileContainer(
                      leading: "Date of birth", value: "02-05-1997"),
                  const ProfileContainer(
                      leading: "Email", value: "abcqwertyu@gmail.com"),
                  // --------------- Plan Settings
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Plan Settings",
                      size: 18,
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ProfileContainer(
                    leading: "Current Plan",
                    value: "Free",
                    booleanValue: true,
                  ),
                  // --------------- Discovery Settings
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Discovery Settings",
                      size: 18,
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ProfileContainer(
                    leading: "Location",
                    value: "My Current Location",
                    booleanValue: true,
                  ),
                  const ProfileContainer(
                    leading: "Preferred Languages",
                    value: "English",
                    booleanValue: true,
                  ),
                  const ProfileContainer(
                    leading: "Show Me",
                    value: "Men",
                    booleanValue: true,
                  ),
                  const ProfileButton(title: "Logout"),
                  const ProfileButton(
                    title: "Delete Account",
                    booleanValue: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
