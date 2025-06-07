import 'package:book_a_doctor/core/di/dependency_injection.dart';
import 'package:book_a_doctor/core/routing/app_router.dart';
import 'package:book_a_doctor/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setUpGetIt();
  // To fix the issue of ScreenUtil texts begin hidden
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}
