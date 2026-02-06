import 'package:bookly/core/errors/api_failures.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/features/Home/data/repos/home_repo.dart';
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
              'volumes?Filtering=free-ebooks&q=subject:programming');
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
              'volumes?Filtering=free-ebooks&q=computer science&Sorting=newest');
      return right(BookModel.fromJson(data));
    } catch (e) {
      if (e is DioException){
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
   
  }
}
