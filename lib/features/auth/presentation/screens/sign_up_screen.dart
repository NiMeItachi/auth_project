import 'package:flutter/material.dart';
import 'package:learn_auth/features/auth/presentation/components/text_field_comp.dart';
import 'package:learn_auth/service_locator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.475,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextField(
                    controller: nameController, hintText: "Full Name"),
                CustomTextField(controller: emailController, hintText: "Email"),
                CustomTextField(
                    controller: birthDateController, hintText: "Birthdate"),
                CustomTextField(
                    controller: passwordController,
                    hintText: "Password",
                    isObscure: true),
                ElevatedButton(
                  onPressed: () {
                    final result = authController.registration(
                      nameController,
                      emailController,
                      birthDateController,
                      passwordController,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result['message'] ?? '')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      minimumSize: const Size(double.infinity, 55),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                  child: const Text("SignUp"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    birthDateController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
