import 'package:bookly/config/models/book_model/item.dart';
import 'package:bookly/features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/features/Home/presentation/views/home_view.dart';
import 'package:bookly/features/Search/presentation/views/search_view.dart';
import 'package:bookly/features/Splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const homeView = '/homeView';
  static const bookDetailsView = '/bookDetailsView';
  static const searchView = '/searchView';
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
      GoRoute(
          path: bookDetailsView,
          builder: (context, state) => BookDetailsView(
            bookItem: state.extra as Item,
          )),
      GoRoute(
          path: searchView, builder: (context, state) => const SearchView()),
    ],
  );
}
