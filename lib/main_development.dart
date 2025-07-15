import 'package:book_a_doctor/core/di/dependency_injection.dart';
import 'package:book_a_doctor/core/helpers/constants.dart';
import 'package:book_a_doctor/core/helpers/extensions.dart';
import 'package:book_a_doctor/core/helpers/shared_pref_helper.dart';
import 'package:book_a_doctor/core/routing/app_router.dart';
import 'package:book_a_doctor/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  // To fix the issue of ScreenUtil texts begin hidden
  await ScreenUtil.ensureScreenSize();
  await checkIfUserLoggedIn();
  runApp(DocApp(appRouter: AppRouter()));
}

checkIfUserLoggedIn() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
