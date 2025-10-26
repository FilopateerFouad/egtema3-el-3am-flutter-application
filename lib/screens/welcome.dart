import 'dart:async';

import 'package:egtema3elegtema3el3am/screens/login.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cp) {
        return const Login();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6CFA9),
      body: Center(
          child: Image.asset(
        'assets/logo.png',
        fit: BoxFit.cover,
        width: 250,
        height: 250,
      )),
    );
  }
}
