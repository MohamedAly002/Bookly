import 'package:bookly/config/di/di.dart';
import 'package:bookly/core/theme/colors/colors.dart';
import 'package:bookly/config/app_routers/app_routers.dart';
import 'package:bookly/core/values/strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  
  // 2. Preserve the native splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kprimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.router,
    );
  }
}
