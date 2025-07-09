import 'package:book_a_doctor/core/helpers/spacing.dart';
import 'package:book_a_doctor/features/home/logic/home_cubit.dart';
import 'package:book_a_doctor/features/home/logic/home_state.dart';
import 'package:book_a_doctor/features/home/ui/widgets/doctors_list_view.dart';
import 'package:book_a_doctor/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpicalizationAndDoctorsBlocBuilder extends StatelessWidget {
  const SpicalizationAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) =>
              current is SpecializationLoading ||
              current is SpecializationSuccess ||
              current is SpecializationError,

      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () {
            return setupLoading();
          },
          specializationSuccess: (specializationsResponseModel) {
            var specializationsList =
                specializationsResponseModel.specializationDataList;
            return setupSuccess(specializationsList);
          },
          specializationError: (errorHandler) => setupError(),

          orElse: () {
            return SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return SizedBox(
      height: 100,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget setupSuccess(specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationsDataList: specializationsList ?? [],
          ),
          verticalSpace(8),
          DoctorsListView(doctorsList: specializationsList?[0]?.doctorsList),
        ],
      ),
    );
  }

  setupError() {
    return SizedBox.shrink();
  }
}
