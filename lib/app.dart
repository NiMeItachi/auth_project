import 'package:flutter/material.dart';
import 'package:learn_auth/features/auth/presentation/screens/sign_up_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpScreen(),
    );
  }
}
