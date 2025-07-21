import 'package:book_a_doctor/core/helpers/spacing.dart';
import 'package:book_a_doctor/core/theaming/colors.dart';
import 'package:book_a_doctor/core/theaming/styles.dart';
import 'package:book_a_doctor/features/home/data/models/specializations_resposive_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  final int itemIndex;
  final SpecializationsData? specializationsData;
  final int selectedIndex;
  const SpecialityListViewItem({
    super.key,
    required this.itemIndex,
    this.specializationsData,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          itemIndex == selectedIndex
              ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.darkBlue, ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/general_speciality.svg',
                    width: 42.w,
                    height: 42.h,
                  ),
                ),
              )
              : CircleAvatar(
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
            style:
                itemIndex == selectedIndex
                    ? TextStyles.font14DarkBlueBold
                    : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
