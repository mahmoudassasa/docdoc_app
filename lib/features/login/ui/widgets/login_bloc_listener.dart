import 'package:book_a_doctor/core/helpers/extensions.dart';
import 'package:book_a_doctor/core/networking/api_error_model.dart';
import 'package:book_a_doctor/core/routing/routes.dart';
import 'package:book_a_doctor/core/theaming/colors.dart';
import 'package:book_a_doctor/core/theaming/styles.dart';
import 'package:book_a_doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:book_a_doctor/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () {
            showDialog(
              context: context,
              builder:
                  (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainBlue,
                    ),
                  ),
            );
          },
          loginSuccess: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          loginError: (apiErrorModel) {
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      listenWhen:
          (previous, current) =>
              current is LoginLoading ||
              current is LoginSuccess ||
              current is LoginError,
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: Icon(Icons.error, color: Colors.red, size: 32),
            content: Text(
              apiErrorModel.getAllErrorMessages(),
              style: TextStyles.font15DarkBlueMedium,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Go it', style: TextStyles.font14BlueSemiBold),
              ),
            ],
          ),
    );
  }
}
