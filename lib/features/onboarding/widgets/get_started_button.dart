import 'package:book_a_doctor/core/helpers/extensions.dart';
import 'package:book_a_doctor/core/routing/routes.dart';
import 'package:book_a_doctor/core/theaming/colors.dart';
import 'package:book_a_doctor/core/theaming/styles.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(
          Size(double.infinity, 52),
        ),
        backgroundColor: WidgetStateProperty.all(ColorsManager.mainBlue),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteMedium,
      ),
    );
  }
}
