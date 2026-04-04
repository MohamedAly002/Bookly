import 'package:bookly/config/errors/error_widget.dart';
import 'package:bookly/core/widgets/book_item.dart';
import 'package:bookly/features/Search/presentation/view_model/search_cubit.dart';
import 'package:bookly/features/Search/presentation/view_model/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.searchState.data != null) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: state.searchState.data!.items.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookItem(
                  bookItem: state.searchState.data!.items[index],
                ),
              ),
            ),
          );
        } else if (state.searchState.errorMessage != null) {
          return ShowErrorWidget(message: state.searchState.errorMessage!);
        } else if (state.searchState.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
