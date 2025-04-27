import 'package:book_a_doctor/core/routing/routes.dart';
import 'package:book_a_doctor/features/login/ui/login_screen.dart';
import 'package:book_a_doctor/features/onboarding/onboarding_sceen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingSceen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defiend for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
