import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:school_app/config/colors.dart';
import 'package:school_app/routes/routes.dart';

import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(150, 231, 26, 12),
              gradient: my_gradient,
            ),
          ),
          Center(
            child: Container(
              child: Container(
                child: Image.asset("assets/images/logo.png",
                    height: 200, width: 200),
              ),
            ),
          )
        ],
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
