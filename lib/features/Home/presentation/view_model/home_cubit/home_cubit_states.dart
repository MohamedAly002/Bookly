import 'package:bookly/config/base_state/base_state.dart';
import 'package:bookly/config/models/book_models/book_model.dart';
import 'package:equatable/equatable.dart';

class HomeCubitStates extends Equatable {
  final BaseState<BooksModel> getFeaturedBooks;
  final BaseState<BooksModel> getNewestBooks;
  const HomeCubitStates({
    this.getFeaturedBooks = const BaseState(),
    this.getNewestBooks = const BaseState(),
  });
  HomeCubitStates copyWith({
    final BaseState<BooksModel>? getFeaturedBooks,
    final BaseState<BooksModel>? getNewestBooks,
  }) {
    return HomeCubitStates(
      getFeaturedBooks: getFeaturedBooks ?? this.getFeaturedBooks,
      getNewestBooks: getNewestBooks ?? this.getNewestBooks,
    );
  }

  @override
  List<Object?> get props => [getFeaturedBooks, getNewestBooks];
}
