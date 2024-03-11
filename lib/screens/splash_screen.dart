import 'dart:async';

import 'package:finanice_app/colors/colors.dart';
import 'package:finanice_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/logo.svg'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Finance',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: kPrimaryGreenColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
