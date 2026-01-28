import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextfield extends StatelessWidget {
  const CustomSearchTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric( vertical: 20),
      child: TextField(
          decoration: InputDecoration(
        hintText: 'Search for your favorite books',
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
      )),
    );
  }
}
