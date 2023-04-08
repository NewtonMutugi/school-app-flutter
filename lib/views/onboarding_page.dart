import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:school_app/routes/routes.dart';
import 'package:school_app/views/widgets/text_field.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
      showNextButton: true,
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      onSkip: () => {},
      pages: [
        PageViewModel(
          title: 'Manage all your Sacco finances',
          body: 'Get all your sacco information in one appp',
          image: SvgPicture.asset(
            'assets/images/savings.svg',
            height: 175.0,
          ),
        ),
        PageViewModel(
            title: 'Manage all your Sacco finances',
            body: 'Get all your sacco information in one appp',
            image: SvgPicture.asset(
              'assets/images/savings.svg',
              height: 175.0,
            )),
        PageViewModel(
            title: 'Manage all your Sacco finances',
            body: 'Get all your sacco information in one appp',
            image: SvgPicture.asset(
              'assets/images/savings.svg',
              height: 175.0,
            ))
      ],
      done: const Text('Continue',
          style: TextStyle(fontWeight: FontWeight.normal)),
      onDone: () => Get.offAllNamed(Routes.getLoginRoute()),
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
