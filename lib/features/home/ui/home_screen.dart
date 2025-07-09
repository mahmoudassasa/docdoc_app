import 'package:book_a_doctor/core/helpers/spacing.dart';

import 'package:book_a_doctor/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:book_a_doctor/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:book_a_doctor/features/home/ui/widgets/home_top_bar.dart';
import 'package:book_a_doctor/features/home/ui/widgets/spicalization_and_doctors_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopBar(),
              DoctorsBlueContainer(),
              verticalSpace(24.h),
              DoctorsSpecialitySeeAll(),
              verticalSpace(18),
              SpicalizationAndDoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  
}
