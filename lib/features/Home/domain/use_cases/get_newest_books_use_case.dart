import 'package:bookly/config/errors/api_failures.dart';
import 'package:bookly/features/Home/domain/models/book_model.dart';
import 'package:bookly/features/Home/domain/repo/home_repo_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetNewestBooksUseCase {
  final HomeRepoContract homeRepoContract;
  GetNewestBooksUseCase(this.homeRepoContract);
  Future<Either<ApiFailures, BooksModel>> call() {
    return homeRepoContract.fetchNewestBooks();
  }
}