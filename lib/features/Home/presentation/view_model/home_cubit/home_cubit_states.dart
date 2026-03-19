import 'package:bookly/config/base_state/base_state.dart';
import 'package:bookly/config/models/book_model/book_model.dart';

class HomeCubitStates {
  BaseState<BookModel> getFeaturedBooks =
      BaseState<BookModel>(isLoading: true, data: null);
  BaseState<BookModel> getNewestBooks =
      BaseState<BookModel>(isLoading: true, data: null);
  HomeCubitStates({
    getFeaturedBooks,
    getNewestBooks,
  }) {
    this.getFeaturedBooks =
        getFeaturedBooks ?? BaseState<BookModel>(isLoading: true, data: null);
    this.getNewestBooks = getNewestBooks ??
        BaseState<BookModel>(
          isLoading: true,
          data: null,
        );
  }
  HomeCubitStates copyWith({
    final BaseState<BookModel>? getFeaturedBooks,
    final BaseState<BookModel>? getNewestBooks,
  }) {
    return HomeCubitStates(
      getFeaturedBooks: getFeaturedBooks ?? this.getFeaturedBooks,
      getNewestBooks: getNewestBooks ?? this.getNewestBooks,
    );
  }
}
