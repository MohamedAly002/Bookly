import 'package:bookly/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class BooksActionButtons extends StatelessWidget {
  const BooksActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30),
      child:  Row(
        children: [
          Expanded(child: CustomTextButton(text: '19.99€',textColor: Colors.black, backgroundColor: Colors.white, borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ))),
           Expanded(child: CustomTextButton(text: 'Free preview',textColor: Colors.white, backgroundColor: Color(0xffEF8262), borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
          ))),
        ],
      ),
    );
  }
}