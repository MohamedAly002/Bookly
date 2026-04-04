import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ShowErrorWidget extends StatelessWidget {
  const ShowErrorWidget({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 48,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Styles.textStyle14.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
