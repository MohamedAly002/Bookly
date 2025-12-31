import 'package:bookly/features/Home/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Column(
      children: [
         CustomBookDetailsAppBar(),
        
      ],
    );
  }
}
