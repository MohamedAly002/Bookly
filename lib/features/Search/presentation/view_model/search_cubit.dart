import 'dart:async';
import 'package:bookly/config/base_state/base_state.dart';
import 'package:bookly/config/models/book_models/book_model.dart';
import 'package:bookly/features/Search/domain/use_cases/search_use_case.dart';
import 'package:bookly/features/Search/presentation/view_model/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(const SearchState());
  SearchUseCase searchUseCase;
  Timer? _debounce;
  Future<void> fetchSearchBooks({required String query}) async {
    emit(state.copyWith(
        searchState: state.searchState.copyWith(isLoadingParam: true)));
    final result = await searchUseCase.call(query: query);
    result.fold(
        (failure) => emit(state.copyWith(
            searchState: state.searchState
                .copyWith(errorMessageParam: failure.errormessage))),
        (books) => emit(state.copyWith(
              searchState: state.searchState.copyWith(dataParam: books),
            )));
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 600), () {
      if (query.trim().isNotEmpty) {
        fetchSearchBooks(query: query);
      } else {
        clearSearch();
      }
    });
  }

  void clearSearch() {
    emit(state.copyWith(
      searchState: const BaseState<BooksModel>(
        isLoading: false,
        data: null,
        errorMessage: null,
      ),
    ));
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
