import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/config/api_services/api_services.dart';
import 'package:bookly/core/endpoints/endpoints.dart';
import 'package:bookly/config/models/book_model/book_model.dart';
import 'package:bookly/features/Home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<ApiFailures, BookModel>> fetchFeaturedBooks() async {
    try {
      var data = await apiServices.get(
          endPoint:
              ApiEndpoints.featuredBooks);
      return right(BookModel.fromJson(data));
    } catch (e) {
      if (e is DioException){
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<ApiFailures, BookModel>> fetchNewestBooks()async {
    try {
      var data = await apiServices.get(
          endPoint:
              ApiEndpoints.newestBooks);
      return right(BookModel.fromJson(data));
    } catch (e) {
      if (e is DioException){
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
   
  }

  @override
  Future<Either<ApiFailures, BookModel>> fetchSimilarBooks({required String category})async {
    try {
      var data = await apiServices.get(
          endPoint:
              '${ApiEndpoints.similarBooks}$category');
      return right(BookModel.fromJson(data));
    } catch (e) {
      if (e is DioException){
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
   
  }
}
