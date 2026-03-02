import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/config/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ApiFailures, BookModel>> fetchNewestBooks();
  Future<Either<ApiFailures, BookModel>> fetchFeaturedBooks();
  Future<Either<ApiFailures, BookModel>> fetchSimilarBooks({required String category});
  
}