import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/config/models/book_models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepoContract {
  Future<Either<ApiFailures, BooksModel>> fetchNewestBooks();
  Future<Either<ApiFailures, BooksModel>> fetchFeaturedBooks();
  Future<Either<ApiFailures, BooksModel>> fetchSimilarBooks(
      {required String category});
}
