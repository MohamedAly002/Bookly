import 'package:bookly/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.borderRadius,
    required this.textColor,
    this.onPressed,
    this.isloading=false,
  });
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final void Function()? onPressed;
  final bool isloading;
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
     onPressed: isloading ? null : onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: isloading?const CircularProgressIndicator():Text(
          text,
          style: Styles.textStyle18
              .copyWith(fontWeight: FontWeight.bold, color: textColor),
        ),
      ),
    );
  }
}
