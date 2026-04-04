import 'package:bookly/config/app_routers/router_paths.dart';
import 'package:bookly/config/models/book_models/items_model.dart';
import 'package:bookly/features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/features/Home/presentation/views/home_view.dart';
import 'package:bookly/features/Search/presentation/views/search_view.dart';
import 'package:bookly/features/Splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RouterPaths.splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RouterPaths.homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
          path: RouterPaths.bookDetailsView,
          builder: (context, state) => BookDetailsView(
                bookItem: state.extra as ItemsModel,
              )),
      GoRoute(
          path: RouterPaths.searchView,
          builder: (context, state) => const SearchView()),
    ],
  );
}
