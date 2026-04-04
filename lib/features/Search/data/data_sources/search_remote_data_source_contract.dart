import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/config/models/book_dto/book_model_dto.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRemoteDataSourceContract {
  Future<Either<ApiFailures, BooksDto>> fetchSearchBooks(
      {required String query});
}
