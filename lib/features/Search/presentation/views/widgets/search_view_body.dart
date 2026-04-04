import 'package:bookly/core/values/strings/app_strings.dart';
import 'package:bookly/core/theme/styles.dart';
import 'package:bookly/features/Search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:bookly/features/Search/presentation/views/widgets/search_result_listview.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        CustomSearchTextfield(),
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              AppStrings.searchResult,
              style: Styles.textStyle18,
            )),
        SizedBox(
          height: 20,
        ),
        SearchResultListview(),
      ]),
    );
  }
}
