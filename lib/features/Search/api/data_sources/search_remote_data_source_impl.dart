import 'package:bookly/config/api_client/books_api_client.dart';
import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/config/models/book_dto/book_model_dto.dart';
import 'package:bookly/core/values/endpoints/api_endpoints.dart';
import 'package:bookly/features/Search/data/data_sources/search_remote_data_source_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRemoteDataSourceContract)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSourceContract {
  BooksApiClient booksApiClient;

  SearchRemoteDataSourceImpl(this.booksApiClient);
  @override
  Future<Either<ApiFailures, BooksDto>> fetchSearchBooks(
      {required String query}) async {
    try {
      var data = await booksApiClient.get(
          endPoint: '${ApiEndpoints.searchBooks}$query');
      return right(BooksDto.fromJson(data));
    } catch (e) {
      return left(ServerFailures.failureHandler(e));
    }
  }
}
