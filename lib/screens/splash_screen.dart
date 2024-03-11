import 'dart:async';

import 'package:finanice_app/colors/colors.dart';
import 'package:finanice_app/screens/home_screen.dart';
import 'package:finanice_app/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _checkFirstSeen();
  }

  void _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seenOnboarding') ?? false);

    Timer(const Duration(seconds: 2), () async  {
      if (seen == true) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      await prefs.setBool('seenOnboarding', true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    }
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
