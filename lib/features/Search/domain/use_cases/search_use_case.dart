import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/config/models/book_models/book_model.dart';
import 'package:bookly/features/Search/domain/repo/search_repo_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchUseCase {
  SearchRepoContract searchRepoContract;
  SearchUseCase({required this.searchRepoContract});

  Future<Either<ApiFailures, BooksModel>> call({required String query}) =>
      searchRepoContract.fetchSearchBooks(query: query);
}
