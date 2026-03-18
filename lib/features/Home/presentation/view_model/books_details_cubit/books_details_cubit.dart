import 'dart:developer';

import 'package:bookly/config/models/book_model/book_model.dart';
import 'package:bookly/features/Home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'books_details_cubit_state.dart';

class BooksDetailsCubit extends Cubit<BooksDetailsState> {
  BooksDetailsCubit(this.homeRepo) : super(BooksDetailsInitial());

  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(BooksDetailsLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(BooksDetailsFailure(failure.errormessage));
    }, (books) {
      emit(BooksDetailsSuccess(books));
    });
  }
  Future <void> urlLauncher(String? link) async {       
                  if (link == null) {
                    log("No preview link available");
                    return;
                  }
                  final Uri url = Uri.parse(link);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                      mode:
                          LaunchMode.inAppBrowserView, // opens inside the app
                    );
                  } else {
                    throw 'Could not launch $url';
                  }
                }

}
