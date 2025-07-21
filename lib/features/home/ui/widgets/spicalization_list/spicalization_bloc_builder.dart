import 'package:book_a_doctor/core/helpers/spacing.dart';
import 'package:book_a_doctor/features/home/logic/home_cubit.dart';
import 'package:book_a_doctor/features/home/logic/home_state.dart';
import 'package:book_a_doctor/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:book_a_doctor/features/home/ui/widgets/spicalization_list/speciality_list_view.dart';
import 'package:book_a_doctor/features/home/ui/widgets/spicalization_list/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpicalizationBlocBuilder extends StatelessWidget {
  const SpicalizationBlocBuilder({super.key});

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
          specializationSuccess: (specializationDataList) {
            var specializationsList = specializationDataList;
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
/// Shimmer loading for the specialization list and doctors list
  Widget setupLoading() {
    return Expanded(
      child: Column(children: [
        SpecialityShimmerLoading(),
        verticalSpace(8),
        DoctorsShimmerLoading(),
      ],
        
      ),
    );
  }

  Widget setupSuccess(specializationsList) {
    return SpecialityListView(
      specializationsDataList: specializationsList ?? [],
    );
  }

  setupError() {
    return SizedBox.shrink();
  }
}
