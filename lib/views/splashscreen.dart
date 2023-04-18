import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/config/colors.dart';
import 'package:school_app/routes/routes.dart';

import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(150, 231, 26, 12),
          gradient: my_gradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(150, 231, 26, 12),
                gradient: my_gradient,
              ),
            ),
            Image.asset("assets/images/logo.png", height: 200, width: 200),
            Container(
              child: Column(
                children: [
                  Text(
                    "School App",
                    style: GoogleFonts.openSans(
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Plan your education in style",
                    style: GoogleFonts.openSans(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(),
            const SizedBox(),
            const SizedBox(height: 20),
            const SpinKitThreeInOut(
              color: Colors.red,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}

startTimer() async {
  var duration = Duration(seconds: 5);
  return Timer(duration, loginRoute);
}

loginRoute() {
  Get.offAllNamed(Routes.getOnboardingRoute());
}
