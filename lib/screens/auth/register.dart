import 'package:flutter/material.dart';
import '../../const/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textformfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required.';
    }
    return null; // return null if there are no errors
  }

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
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 25),
                const Image(image: AssetImage("assets/heart.png")),
                const CustomText(
                  text: "Register Here.",
                  size: 28,
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomText(
                          text: "Enter your Name",
                          size: 16,
                          color: blackColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomTextField(
                          controller: _nameController,
                          obscureText: false,
                          validator: validateName,
                        ),
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
                        const SizedBox(height: 20.0),
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
