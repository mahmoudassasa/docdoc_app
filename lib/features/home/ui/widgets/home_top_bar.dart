import 'package:book_a_doctor/core/theaming/colors.dart';
import 'package:book_a_doctor/core/theaming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, Mahmoud!', style: TextStyles.font18DarkBlueBold),
            Text('How are you today?', style: TextStyles.font12GrayRegular),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset(
            'assets/svgs/notification.svg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
