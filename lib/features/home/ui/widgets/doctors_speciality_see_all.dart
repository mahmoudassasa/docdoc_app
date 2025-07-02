
import 'package:book_a_doctor/core/theaming/styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
Text(
        'Doctors Speciality',
        style: TextStyles.font18DarkBlueSemiBold,
      ),
      const Spacer(),
      TextButton(
        onPressed: () {
          // Action for "See All"
        },
        child: Text(
          'See All',
          style: TextStyles.font12BlueRegular,
        ),
      ),

    ],);
  }
}