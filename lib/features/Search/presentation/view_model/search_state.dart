import 'package:bookly/config/base_state/base_state.dart';
import 'package:bookly/config/models/book_models/book_model.dart';
import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final BaseState<BooksModel> searchState;
  const SearchState({this.searchState = const BaseState()});

  SearchState copyWith({
    final BaseState<BooksModel>? searchState,
  }) {
    return SearchState(searchState: searchState ?? this.searchState);
  }

  @override
  List<Object?> get props => [searchState];
}
