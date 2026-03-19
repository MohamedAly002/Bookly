import 'package:bookly/config/models/book_model/item.dart';
import 'package:bookly/core/strings/app_strings.dart';
import 'package:bookly/core/utils/functions/show_snack_bar.dart';
import 'package:bookly/core/widgets/custom_text_button.dart';
import 'package:bookly/features/Home/presentation/view_model/books_details_cubit/books_details_cubit.dart';
import 'package:bookly/features/Home/presentation/view_model/books_details_cubit/books_details_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksActionButtons extends StatelessWidget {
  const BooksActionButtons({super.key, required this.itemModel});
  final Item itemModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksDetailsCubit, BooksDetailsStates>(
      listener: (context, state) {
        if (state.previewBookState.errorMessage != null) {
          showSnackBar(
              context: context,
              message: state.previewBookState.errorMessage!,
              color: Colors.red);
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            const Expanded(
                child: CustomTextButton(
                    text: AppStrings.freeprice,
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ))),
            Expanded(
                child: CustomTextButton(
                    onPressed: () {
                      context.read<BooksDetailsCubit>().urlLauncher(
                            itemModel.volumeInfo.previewLink,
                          );
                    },
                    isloading: state.previewBookState.isLoading,
                    text: AppStrings.freepreview,
                    textColor: Colors.white,
                    backgroundColor: const Color(0xffEF8262),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                    )))
          ],
        ),
      ),
    );
  }
}
