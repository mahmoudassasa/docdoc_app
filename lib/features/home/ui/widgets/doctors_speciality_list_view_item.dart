

import 'package:book_a_doctor/core/helpers/spacing.dart';
import 'package:book_a_doctor/core/theaming/colors.dart';
import 'package:book_a_doctor/core/theaming/styles.dart';
import 'package:book_a_doctor/features/home/data/models/specializations_resposive_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsSpecialityListViewItem  extends StatelessWidget {
  final int itemIndex;
  final SpecializationsData? specializationsData;
  const DoctorsSpecialityListViewItem ({super.key, required this.itemIndex, this.specializationsData, });

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/general_speciality.svg',
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
                verticalSpace(8),
                Text(
                  specializationsData?.name ?? 'Speciality ${itemIndex + 1}',
                  style: TextStyles.font12DarkBlueRegular,
                ),
              ],
            ),
          );
  }
}