import 'package:book_a_doctor/core/di/dependency_injection.dart';
import 'package:book_a_doctor/core/routing/routes.dart';
import 'package:book_a_doctor/features/home/ui/home_screen.dart';
import 'package:book_a_doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:book_a_doctor/features/login/ui/login_screen.dart';
import 'package:book_a_doctor/features/onboarding/onboarding_sceen.dart';
import 'package:book_a_doctor/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:book_a_doctor/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingSceen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: const SignupScreen(),
              ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defiend for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
