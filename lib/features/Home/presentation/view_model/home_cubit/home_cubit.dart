import 'package:bookly/features/Home/data/repo/home_repo.dart';
import 'package:bookly/features/Home/presentation/view_model/home_cubit/home_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeCubitStates> {
  HomeCubit(this.homeRepo) : super(HomeCubitStates());
    final HomeRepo homeRepo;

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
    var result = await homeRepo.fetchFeaturedBooks();
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
    var result = await homeRepo.fetchNewestBooks();
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
