import 'package:bookly/core/colors.dart';
import 'package:bookly/config/app_routers/app_routers.dart';
import 'package:bookly/config/service_locator/service_locator.dart';
import 'package:bookly/features/Home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/Home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/Home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getit.get<HomeRepoImpl>())..fetchFeaturedBooks(),
        ),
        BlocProvider(
            create: (context) => NewestBooksCubit(getit.get<HomeRepoImpl>())..fetchNewestBooks())
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        title: 'Bookly',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouters.router,
      ),
    );
  }
}
