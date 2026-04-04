import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/config/models/book_models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepoContract {
  Future<Either<ApiFailures, BooksModel>> fetchSearchBooks(
      {required String query});
}
