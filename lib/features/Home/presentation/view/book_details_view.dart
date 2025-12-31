import 'package:bookly/features/Home/presentation/view/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child:  Scaffold(
        
        body:   BookDetailsViewBody(),
      ),
    );
  }
}