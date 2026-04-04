import 'package:bookly/config/errors/error_widget.dart';
import 'package:bookly/features/Home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:bookly/features/Home/presentation/view_model/home_cubit/home_cubit_states.dart';
import 'package:bookly/core/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitStates>(
      builder: (context, state) {
        if (state.getNewestBooks.data != null) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.getNewestBooks.data!.items.length,
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookItem(
                  bookItem: state.getNewestBooks.data!.items[index],
                ),
              ),
            ),
          );
        } else if (state.getNewestBooks.errorMessage != null) {
          return SliverToBoxAdapter(
            child: ShowErrorWidget(
              message: state.getNewestBooks.errorMessage!,
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
