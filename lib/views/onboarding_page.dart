import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:school_app/config/colors.dart';
import 'package:school_app/routes/routes.dart';
import 'package:school_app/views/widgets/custom_widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(150, 231, 26, 12),
        gradient: my_gradient,
      ),
      child: IntroductionScreen(
        showNextButton: true,
        showSkipButton: true,
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        onSkip: () => {},
        pages: [
          PageViewModel(
            title: 'Manage all your School Activities',
            body: 'Get all your school information in one app',
            image: SvgPicture.asset(
              'assets/images/savings.svg',
              height: 175.0,
            ),
          ),
          PageViewModel(
              title: 'Manage all your School Activities',
              body: 'Get all your school information in one app',
              image: SvgPicture.asset(
                'assets/images/savings.svg',
                height: 175.0,
              )),
          PageViewModel(
              title: 'Manage all your School Activities',
              body: 'Get all your school information in one app',
              image: SvgPicture.asset(
                'assets/images/savings.svg',
                height: 175.0,
              ))
        ],
        done: const Text('Continue',
            style: TextStyle(fontWeight: FontWeight.normal)),
        onDone: () => Get.offAllNamed(Routes.getLoginRoute()),
      ),
    ));
  }

  Widget buildImage(String path) => Align(
      child: Image.asset(path, width: 350.0), alignment: Alignment.center);
  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyTextStyle: TextStyle(fontSize: 19.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
      );
}
