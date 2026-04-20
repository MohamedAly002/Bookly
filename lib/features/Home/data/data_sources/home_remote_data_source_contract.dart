import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/config/models/book_dto/book_model_dto.dart';
import 'package:dartz/dartz.dart';

abstract interface class HomeRemoteDataSourceContract {
  Future<Either<ApiFailures, BooksDto>> fetchFeaturedBooks();
  Future<Either<ApiFailures, BooksDto>> fetchNewestBooks();
  Future<Either<ApiFailures, BooksDto>> fetchSimilarBooks(
      {required String category});
}
