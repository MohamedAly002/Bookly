part of 'books_details_cubit.dart';

sealed class BooksDetailsState extends Equatable {
  const BooksDetailsState();

  @override
  List<Object> get props => [];
}

final class BooksDetailsInitial extends BooksDetailsState {}

final class BooksDetailsSuccess extends BooksDetailsState {
  final BookModel books;
  const BooksDetailsSuccess(this.books);
}

final class BooksDetailsFailure extends BooksDetailsState {
  final String errormessage;
  const BooksDetailsFailure(this.errormessage);
}

final class BooksDetailsLoading extends BooksDetailsState {}
