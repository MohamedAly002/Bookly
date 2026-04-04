import 'package:bookly/config/app_routers/router_paths.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(children: [
        Image.asset(
          AssetsData.appLogo,
          height: MediaQuery.of(context).size.height * 0.024,
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              GoRouter.of(context).push(RouterPaths.searchView);
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ))
      ]),
    );
  }
}
