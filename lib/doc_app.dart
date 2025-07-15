import 'package:book_a_doctor/core/helpers/constants.dart';
import 'package:book_a_doctor/core/theaming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:book_a_doctor/core/routing/app_router.dart';
import 'package:book_a_doctor/core/routing/routes.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      // minTextAdapt: true,
      // splitScreenMode: true,
      child: MaterialApp(
        title: 'Book A Doctor',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
          //for Selection Handle Color
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: ColorsManager.gray,
            selectionColor: ColorsManager.lightGray,
            selectionHandleColor: ColorsManager.mainBlue,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
