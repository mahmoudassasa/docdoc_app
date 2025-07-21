import 'package:book_a_doctor/core/helpers/spacing.dart';
import 'package:book_a_doctor/core/theaming/styles.dart';
import 'package:book_a_doctor/features/home/data/models/specializations_resposive_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorsModel;
  const DoctorsListViewItem({super.key, this.doctorsModel});

  @override
  Widget build(BuildContext context) {
      return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(16),
            // ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    
                    "https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050",
                    width: 110.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorsModel?.name ?? 'Doctor Name',
                        style: TextStyles.font18DarkBlueBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(5),
                      Text(
                        '${doctorsModel?.degree} | ${doctorsModel?.phone}',
                        style: TextStyles.font12GrayMedium,
                      ),
                      verticalSpace(5),
                      Text(
                        doctorsModel?.email ?? 'Email',
                        style: TextStyles.font12GrayMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}