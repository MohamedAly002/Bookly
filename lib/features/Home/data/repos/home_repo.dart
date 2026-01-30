import 'package:bookly/core/errors/api_failures.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ApiFailures, BookModel>> fetchNewestBooks();
  Future<Either<ApiFailures, BookModel>> fetchFeaturedBooks();
  
}