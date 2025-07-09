import 'package:book_a_doctor/core/networking/api_service.dart';
import 'package:book_a_doctor/core/networking/dio_factory.dart';
import 'package:book_a_doctor/features/home/data/apis/home_api_service.dart';
import 'package:book_a_doctor/features/home/data/repos/home_repo.dart';
import 'package:book_a_doctor/features/login/data/repos/login_repo.dart';
import 'package:book_a_doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:book_a_doctor/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:book_a_doctor/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //SignUp
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //Home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  
  
}
