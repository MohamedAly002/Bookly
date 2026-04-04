import 'dart:async';
import 'package:bookly/config/api_client/books_api_client.dart';
import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/config/models/book_dto/book_model_dto.dart';
import 'package:bookly/config/values/endpoints/api_endpoints.dart';
import 'package:bookly/features/Home/data/data_sources/home_remote_data_source_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImp implements HomeRemoteDataSourceContract {
  BooksApiClient booksApiClient;

  HomeRemoteDataSourceImp(this.booksApiClient);
  @override
  Future<Either<ApiFailures, BooksDto>> fetchFeaturedBooks() async {
    try {
      var data = await booksApiClient.get(endPoint: ApiEndpoints.featuredBooks);
      return right(BooksDto.fromJson(data));
    } catch (e) {
      return left(ServerFailures.failureHandler(e));
    }
  }

  @override
  Future<Either<ApiFailures, BooksDto>> fetchNewestBooks() async {
    try {
      var data = await booksApiClient.get(endPoint: ApiEndpoints.newestBooks);
      return right(BooksDto.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<ApiFailures, BooksDto>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await booksApiClient.get(
          endPoint: '${ApiEndpoints.similarBooks}$category');
      return right(BooksDto.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
