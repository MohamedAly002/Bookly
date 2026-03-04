part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final BookModel books;
  const SimilarBooksSuccess(this.books);
}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errormessage;
  const SimilarBooksFailure(this.errormessage);
}

final class SimilarBooksLoading extends SimilarBooksState {}
