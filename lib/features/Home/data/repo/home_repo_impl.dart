import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/features/Home/data/data_sources/home_remote_data_source_contract.dart';
import 'package:bookly/config/models/book_models/book_model.dart';
import 'package:bookly/features/Home/domain/repo/home_repo_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepoContract)
class HomeRepoImpl implements HomeRepoContract {
  final HomeRemoteDataSourceContract homeRemoteDataSource;

  HomeRepoImpl(this.homeRemoteDataSource);
  @override
  Future<Either<ApiFailures, BooksModel>> fetchFeaturedBooks() async {
    var data = await homeRemoteDataSource.fetchFeaturedBooks();
    return (data).fold(
      (failure) => left(failure),
      (dto) => right(dto.todomain()),
    );
  }

  @override
  Future<Either<ApiFailures, BooksModel>> fetchNewestBooks() async {
    var data = await homeRemoteDataSource.fetchNewestBooks();
    return data.fold(
      (failure) => left(failure),
      (dto) => right(dto.todomain()),
    );
  }

  @override
  Future<Either<ApiFailures, BooksModel>> fetchSimilarBooks(
      {required String category}) async {
    var data = await homeRemoteDataSource.fetchSimilarBooks(category: category);
    return data.fold(
      (failure) => left(failure),
      (dto) => right(dto.todomain()),
    );
  }
}
