import 'package:bookly/core/values/strings/app_strings.dart';
import 'package:bookly/features/Search/presentation/view_model/search_cubit.dart';
import 'package:bookly/features/Search/presentation/view_model/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextfield extends StatelessWidget {
  const CustomSearchTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextField(
            decoration: const InputDecoration(
              hintText: AppStrings.searchHintText,
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            onChanged: (value) {
              cubit.onSearchChanged(value);
            },
          ),
        );
      },
    );
  }
}
