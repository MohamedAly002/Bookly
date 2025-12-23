import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}



class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    initSlidingText();
   
    super.initState();
  }

  void initSlidingText() {
      animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1  ));
    slidingAnimation = Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero).animate(animationController);
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.appLogo),
        const SizedBox(
          height: 4,
        ),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }
}

