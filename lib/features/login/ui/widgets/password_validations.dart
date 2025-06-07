import 'package:book_a_doctor/core/helpers/spacing.dart';
import 'package:book_a_doctor/core/theaming/colors.dart';
import 'package:book_a_doctor/core/theaming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValdationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValdationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValdationRow('At least 1 special characters', hasSpecialCharacters),
        verticalSpace(2),
        buildValdationRow('At least 1 number', hasNumber),
        verticalSpace(2),
        buildValdationRow('At least 8 characters long', hasMinLength),

      ],
    );
  }

  Widget buildValdationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(radius: 2.5, backgroundColor: ColorsManager.gray),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2, 
            color: hasValidated ? Colors.grey : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
