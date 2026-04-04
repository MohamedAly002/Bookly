import 'package:bookly/config/base_state/base_state.dart';
import 'package:bookly/config/models/book_models/book_model.dart';

class SearchState {
  BaseState<BooksModel> searchState =
      BaseState<BooksModel>(isLoading: false, data: null);
  SearchState({searchState}) {
    this.searchState =
        searchState ?? BaseState<BooksModel>(isLoading: false, data: null);
  }

  SearchState copyWith({
    final BaseState<BooksModel>? searchState,
  }) {
    return SearchState(searchState: searchState ?? this.searchState);
  }
}
