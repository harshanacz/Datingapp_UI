import 'package:datingapp_ui/screens/register.dart';
import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null; // return null if there are no errors
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    if (!RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)$').hasMatch(value)) {
      return 'Password must contain at least one letter and one number.';
    }
    return null; // return null if there are no errors
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Screen width size
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.5,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: CustomText(
                                text:
                                    "The best place to meet your future partner.",
                                size: 25,
                                color: blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: screenWidth * 0.35,
                              child: const Image(
                                  image: AssetImage("assets/frame.png"))),
                        ],
                      ),
                    ),
                    const Positioned(
                        top: 0,
                        right: 90,
                        child: Image(image: AssetImage("assets/heart.png"))),
                  ],
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomText(
                          text: "Enter your Email",
                          size: 16,
                          color: blackColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomTextField(
                          controller: _emailController,
                          obscureText: false,
                          validator: validateEmail,
                        ),
                        const SizedBox(height: 10.0),
                        const CustomText(
                          text: "Enter your Password",
                          size: 16,
                          color: blackColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomTextField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: validatePassword,
                        ),
                        const SizedBox(height: 10.0),
                        const CustomText(
                          text: "Forgot password",
                          size: 16,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                          textAlign: TextAlign.end,
                        ),
                        const SizedBox(height: 16.0),
                        CustomButton(
                          title: "Login",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Form submitted.')),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const CustomText(
                    text: "Don’t have an account?",
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 35,
                    color: blackColor,
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
