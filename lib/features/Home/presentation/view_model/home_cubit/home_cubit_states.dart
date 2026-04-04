import 'package:bookly/config/base_state/base_state.dart';
import 'package:bookly/config/models/book_dto/book_model_dto.dart';
import 'package:bookly/features/Home/domain/models/book_model.dart';

class HomeCubitStates {
  BaseState<BooksModel> getFeaturedBooks =
      BaseState<BooksModel>(isLoading: true, data: null);
  BaseState<BooksModel> getNewestBooks =
      BaseState<BooksModel>(isLoading: true, data: null);
  HomeCubitStates({
    getFeaturedBooks,
    getNewestBooks,
  }) {
    this.getFeaturedBooks = getFeaturedBooks ??
        BaseState<BooksModel>(isLoading: true, data: null);
    this.getNewestBooks = getNewestBooks ??
        BaseState<BooksModel>(
          isLoading: true,
          data: null,
        );
  }
  HomeCubitStates copyWith({
    final BaseState<BooksModel>? getFeaturedBooks,
    final BaseState<BooksModel>? getNewestBooks,
  }) {
    return HomeCubitStates(
      getFeaturedBooks: getFeaturedBooks ?? this.getFeaturedBooks,
      getNewestBooks: getNewestBooks ?? this.getNewestBooks,
    );
  }
}
