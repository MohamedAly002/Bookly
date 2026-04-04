import 'package:bookly/features/Home/domain/use_cases/get_featured_books_use_case.dart';
import 'package:bookly/features/Home/domain/use_cases/get_newest_books_use_case.dart';
import 'package:bookly/features/Home/presentation/view_model/home_cubit/home_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeCubitStates> {
  HomeCubit(this.getFeaturedBooksUseCase, this.getNewestBooksUseCase)
      : super(HomeCubitStates());
  final GetFeaturedBooksUseCase getFeaturedBooksUseCase;
  final GetNewestBooksUseCase getNewestBooksUseCase;
  void init() {
    fetchFeaturedBooks();
    fetchNewestBooks();
  }

  Future<void> fetchFeaturedBooks() async {
    emit(state.copyWith(
      getFeaturedBooks: state.getFeaturedBooks.copyWith(
        isLoadingParam: true,
      ),
    ));
    var result = await getFeaturedBooksUseCase.call();
    result.fold((failure) {
      emit(state.copyWith(
        getFeaturedBooks: state.getFeaturedBooks.copyWith(
          errorMessageParam: failure.errormessage,
        ),
      ));
    }, (books) {
      emit(state.copyWith(
        getFeaturedBooks: state.getFeaturedBooks.copyWith(
          dataParam: books,
        ),
      ));
    });
  }

  Future<void> fetchNewestBooks() async {
    emit(state.copyWith(
        getNewestBooks: state.getNewestBooks.copyWith(isLoadingParam: true)));
    var result = await getNewestBooksUseCase.call();
    result.fold((failure) {
      emit(state.copyWith(
        getNewestBooks: state.getNewestBooks.copyWith(
          errorMessageParam: failure.errormessage,
        ),
      ));
    }, (books) {
      emit(state.copyWith(
        getNewestBooks: state.getNewestBooks.copyWith(
          dataParam: books,
        ),
      ));
    });
  }
}
