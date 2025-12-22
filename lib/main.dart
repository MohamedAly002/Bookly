import 'package:bookly/constants.dart';
import 'package:bookly/features/Splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: kprimaryColor ,
      ),
      title: 'Bookly',
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
