import 'package:bookly/features/Home/presentation/view/book_details_view.dart';
import 'package:bookly/features/Home/presentation/view/home_view.dart';
import 'package:bookly/features/Splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const  homeView = '/homeView';
  static const bookDetailsView = '/bookDetailsView';
 static final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: homeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(path: bookDetailsView, builder: (context, state) => const BookDetailsView()),
  ],
);
}