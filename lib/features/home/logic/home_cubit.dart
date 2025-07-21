import 'package:book_a_doctor/core/helpers/extensions.dart';
import 'package:book_a_doctor/core/networking/api_error_handler.dart';
import 'package:book_a_doctor/features/home/data/models/specializations_resposive_model.dart';
import 'package:book_a_doctor/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationList = [];

  void getSpecialization() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        specializationList =
            specializationsResponseModel.specializationDataList ?? [];
        //getting the doctors list for the first specialization by default
        getDoctorsList(specializationId: specializationList?.first?.id  );

        emit(HomeState.specializationSuccess(specializationList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationError(errorHandler));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList = getDoctorsListBySpecializationId(
      specializationId,
    );
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorSuccess(doctorsList));
    } else {
      emit(HomeState.doctorError(ErrorHandler.handle('No doctors found ')));
    }
  }

  /// Returns the List of doctors based on Specialization Id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
