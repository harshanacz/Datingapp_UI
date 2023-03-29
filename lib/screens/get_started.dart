import 'dart:math';
import 'package:datingapp_ui/screens/login.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    //Screen width size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),
            // Circles and pictures ----
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                children: [
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image(image: AssetImage("assets/4.png")),
                  ),
                  Container(
                    height: screenWidth * 0.9,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0x00fa5672).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(171.5),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image(image: AssetImage("assets/5.png")),
                  ),
                  const Positioned(
                    top: 15,
                    left: 0,
                    child: Image(image: AssetImage("assets/1.png")),
                  ),
                  const Positioned(
                    top: 15,
                    right: 0,
                    child: Image(image: AssetImage("assets/2.png")),
                  ),
                  const Positioned(
                    bottom: 30,
                    left: 20,
                    child: Image(image: AssetImage("assets/3.png")),
                  ),
                  Positioned(
                    bottom: screenWidth * 0.4,
                    left: 20,
                    child: Container(
                      height: 22,
                      width: 22,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0x00fa5672).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(171.5),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.4,
                    top: 0,
                    child: Container(
                      height: 17,
                      width: 17,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0x00fa5672).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(171.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // tsdsd
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "Let’s get closer.",
                      size: 18,
                      color: blackColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const CustomText(
                    text: "The best place to meet your future partner.",
                    size: 28,
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: "Get Started",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  //agreement
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'By using the app, you accept our company’s ',
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: TextStyle(
                            color: pinkColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policies',
                          style: TextStyle(
                            color: pinkColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
