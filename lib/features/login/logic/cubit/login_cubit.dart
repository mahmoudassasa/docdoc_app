import 'package:book_a_doctor/features/login/data/models/login_request_body.dart';
import 'package:book_a_doctor/features/login/data/repos/login_repo.dart';
import 'package:book_a_doctor/features/login/logic/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); 
  final formKey = GlobalKey<FormState>();




  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );


    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
