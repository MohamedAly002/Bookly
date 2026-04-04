import 'package:bookly/features/Home/domain/use_cases/get_similar_books_use_case.dart';
import 'package:bookly/features/Home/presentation/view_model/books_details_cubit/books_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@injectable
class BooksDetailsCubit extends Cubit<BooksDetailsStates> {
  BooksDetailsCubit(this.getSimilarBooksUseCase) : super(BooksDetailsStates());

  final GetSimilarBooksUseCase getSimilarBooksUseCase;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(state.copyWith(
        getSimilarBooksState:
            state.getSimilarBooksState.copyWith(isLoadingParam: true)));
    var result = await getSimilarBooksUseCase.call(category: category);
    result.fold((failure) {
      emit(state.copyWith(
        getSimilarBooksState: state.getSimilarBooksState.copyWith(
          errorMessageParam: failure.errormessage,
        ),
      ));
    }, (books) {
      emit(state.copyWith(
        getSimilarBooksState: state.getSimilarBooksState.copyWith(
          dataParam: books,
        ),
      ));
    });
  }

  Future<void> urlLauncher(String? link) async {
    if (link == null) {
      emit(state.copyWith(
        previewBookState: state.previewBookState
            .copyWith(errorMessageParam: 'Sorry no preview link found'),
      ));
      return;
    }

    final Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      emit(state.copyWith(
        previewBookState: state.previewBookState.copyWith(isLoadingParam: true),
      ));
      await Future.delayed(const Duration(milliseconds: 200));

      await launchUrl(
        url,
        mode: LaunchMode.inAppBrowserView, // opens inside the app
      );
      emit(state.copyWith(
        previewBookState:
            state.previewBookState.copyWith(isLoadingParam: false),
      ));
    } else {
      emit(state.copyWith(
        previewBookState: state.previewBookState.copyWith(
            errorMessageParam: 'something went wrong, Please try again'),
      ));
    }
  }
}
