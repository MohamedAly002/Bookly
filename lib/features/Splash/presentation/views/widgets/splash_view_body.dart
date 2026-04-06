import 'package:bookly/config/app_routers/router_paths.dart';
import 'package:bookly/core/values/assets/assets_paths.dart';
import 'package:bookly/features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingText();
    navigationToHomeView();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
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

  void navigationToHomeView() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      GoRouter.of(context).pushReplacement(RouterPaths.homeView);
    });
  }


 void initSlidingText() {
  animationController = AnimationController(
    vsync: this, 
    duration: const Duration(seconds: 1), 
  );

  slidingAnimation = Tween<Offset>(
    begin: const Offset(0, 3), 
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: animationController,
    curve: Curves.easeInOut,
  ));

  // The Fix: Wait for the frame, then wait a tiny bit more for the engine to settle
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    // 1. Give the app a moment to finish loading resources
    await Future.delayed(const Duration(milliseconds: 100));
    
    // 2. Remove the native splash screen
    FlutterNativeSplash.remove();
    
    // 3. Start the animation
    if (mounted) {
      animationController.forward();
    }
  });
}
}
