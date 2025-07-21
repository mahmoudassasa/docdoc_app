import 'package:book_a_doctor/core/networking/api_error_handler.dart';
import 'package:book_a_doctor/features/home/data/models/specializations_resposive_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

//Specializations
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(  List<SpecializationsData?>? specializationDataList) = SpecializationSuccess;
  const factory HomeState.specializationError(ErrorHandler errorHandler ) = SpecializationError;
//Doctors
  const factory HomeState.doctorSuccess(List<Doctors?>? doctorsList) = DoctorsSuccess;
  const factory HomeState.doctorError(ErrorHandler errorHandler) = DoctorsError;

}
