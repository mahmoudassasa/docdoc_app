
import 'package:book_a_doctor/features/home/data/models/specializations_resposive_model.dart';
import 'package:book_a_doctor/features/home/ui/widgets/doctors_list_view_item.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key, this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
            doctorsModel: doctorsList?[index],
          );
        },
      ),
    );
  }
}
