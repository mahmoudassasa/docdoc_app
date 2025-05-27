import 'package:book_a_doctor/core/helpers/extensions.dart';
import 'package:book_a_doctor/core/routing/routes.dart';
import 'package:book_a_doctor/core/theaming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        // textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyles.font13DarkBlueRegular,
            ),
            TextSpan(text: ' Sign Up', style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to the sign-up page
                context.pushReplacementNamed(Routes.signUpScreen);
              } 
            ),
          ],
        ),
      ),
    );
  }
}
