import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/config/models/book_models/book_model.dart';
import 'package:bookly/features/Search/data/data_sources/search_remote_data_source_contract.dart';
import 'package:bookly/features/Search/domain/repo/search_repo_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRepoContract)
class SearchRepoImpl implements SearchRepoContract {
  SearchRemoteDataSourceContract searchRemoteDataSourceContract;
  SearchRepoImpl({required this.searchRemoteDataSourceContract});
  @override
  Future<Either<ApiFailures, BooksModel>> fetchSearchBooks(
      {required String query}) async {
    var data =
        await searchRemoteDataSourceContract.fetchSearchBooks(query: query);
    return data.fold(
      (failure) => left(failure),
      (dto) => right(dto.todomain()),
    );
  }
}
