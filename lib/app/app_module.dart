import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mamaboo_v3/resources/app_routers.dart' as Router;
import 'package:mamaboo_v3/view/pages/auth/login_page.dart';
import 'package:mamaboo_v3/view/pages/auth/register_page.dart';
import 'package:mamaboo_v3/view/pages/auth/register_phone_number.dart';
import 'package:mamaboo_v3/view/pages/onboarding/onboarding_page1.dart';
import 'package:mamaboo_v3/view/pages/onboarding/onboarding_page2.dart';
import 'package:mamaboo_v3/view/pages/onboarding/onboarding_page3.dart';
import 'package:mamaboo_v3/view/pages/onboarding/onboarding_page4.dart';
import 'package:mamaboo_v3/view/pages/onboarding/onboarding_page5.dart';
import 'dart:developer' as developer;

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const OnboardingPage1(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.onboarding2,
      child: (context) => const OnboardingPage2(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.onboarding3,
      child: (context) => const OnboardingPage3(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.onboarding4,
      child: (context) => const OnboardingPage4(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.onboarding5,
      child: (context) => const OnboardingPage5(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.loginPage,
      child: (context) => const LoginPage(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.registerPage,
      child: (context) => const RegisterPage(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.registerPhoneNumberPage,
      child: (context) => const RegisterPhoneNumber(),
      transition: TransitionType.rightToLeft,
    );
  }
}


void modularSimpleNavigation({required String router}) {
  debugPrint("===> $router");
  developer.log("PAGE: $router");
  Modular.to.pushNamed(router);
}

void modularMainNavigation({required String router}) {
  debugPrint("===> $router");
  developer.log("PAGE: $router");
  Modular.to.pushReplacementNamed(router);
}

void modularBackNavigation() {
  Modular.to.pop();
}
