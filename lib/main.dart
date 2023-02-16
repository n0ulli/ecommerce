import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokoonline/screen/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.grey.shade400),
        textTheme: TextTheme(),

        // accentColor: ColorConstant.primary1,
        // buttonColor: ColorConstant.primary1,
        // fontFamily: 'WorkSans',
        // buttonTheme: createButtonTheme(context),
      ),
      home: const LoginScreen(),
    );
  }
}
