import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/models/book_model/item.dart';
import 'package:bookly/features/Home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/Home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/Home/presentation/view/book_details_view.dart';
import 'package:bookly/features/Home/presentation/view/home_view.dart';
import 'package:bookly/features/Search/presentation/views/search_view.dart';
import 'package:bookly/features/Splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          builder: (context, state) => BlocProvider(
              create: (context) => SimilarBooksCubit(getit.get<HomeRepoImpl>()),
              child: BookDetailsView(
                bookItem: state.extra as Item,
              ))),
      GoRoute(
          path: searchView, builder: (context, state) => const SearchView()),
    ],
  );
}
