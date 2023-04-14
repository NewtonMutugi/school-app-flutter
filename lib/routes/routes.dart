import 'package:get/get.dart';
import 'package:school_app/views/login_page.dart';
import 'package:school_app/views/onboarding_page.dart';
import 'package:school_app/views/splashscreen.dart';

class Routes {
  static String home = '/';
  static String login = '/login';
  static String onboarding = '/onboarding';
  static String dashboard = '/dashboard';


  static String getHomeRoute() => home;
  static String getLoginRoute() => login;
  static String getOnboardingRoute() => onboarding;
  static String getDashboardRoute() => dashboard;

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const SplashScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: onboarding,
      page: () => const OnboardingPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: dashboard,
      page: () => const LoginPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
   
  ];
}
