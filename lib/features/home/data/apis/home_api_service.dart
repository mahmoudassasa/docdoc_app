

import 'package:book_a_doctor/core/networking/api_constants.dart';
import 'package:book_a_doctor/features/home/data/apis/home_api_constants.dart';
import 'package:book_a_doctor/features/home/data/models/specializations_resposive_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio,) = _HomeApiService;

  @GET(HomeApiConstants.specializationEP)

  Future<SpecializationsResponseModel> getSpecialization();

}
