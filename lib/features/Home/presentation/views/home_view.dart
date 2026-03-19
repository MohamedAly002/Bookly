import 'package:bookly/config/service_locator/service_locator.dart';
import 'package:bookly/features/Home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/Home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:bookly/features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(getit.get<HomeRepoImpl>())..init(),
      child: const SafeArea(
        child: Scaffold(
          body: HomeViewBody(),
        ),
      ),
    );
  }
}
