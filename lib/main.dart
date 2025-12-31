import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kprimaryColor ,
        textTheme:  GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      title: 'Bookly',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.router,
    );
  }
}
