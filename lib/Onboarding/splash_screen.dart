// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:crypto_buddy/Onboarding/app_intro.dart';
import 'package:crypto_buddy/Onboarding/auth_check.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    // FirebaseFirestore.instance.collection('admins');
    super.initState();
    Timer(const Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AppIntro())));
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      'assets/images/study.png',
      height: 200,
    );
    var title = const Text(
      'Crypto Buddy',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
    return Scaffold(
      body: Center(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image,
                title
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}
