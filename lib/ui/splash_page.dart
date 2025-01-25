import 'package:fixiconn/top_level_widget/my_text.dart';
import 'package:fixiconn/ui/onboarding_page.dart';
import 'package:fixiconn/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboardingPage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF87CEEB), // #87CEEB
                  Color(0xFF74C2EE), // #74C2EE
                  Color(0xFF87CEEB), // #87CEEB
                  Color(0xFF60B6F1), // #60B6F1
                  Color(0xFF74C2EE), // #74C2EE
                  Color(0xFF4DAAF4), // #4DAAF4
                  Color(0xff60B6F1), // #60B6F1
                  Color(0xFF3A9FF6), // #3A9FF6
                  Color(0xFF4DAAF4), // #4DAAF4
                  Color(0xFF2793F9), // #2793F9
                  Color(0xFF3A9FF6), // #3A9FF6
                  Color(0xFF1387FC), // #1387FC
                  Color(0xFF2793F9),
                  Color(0xFF007BFF), // #007BFF
                  Color(0xFF1387FC),
                  Color(0xFF007BFF)
                ],
                stops: [
                  -0.1246, // -12.46%
                  -0.0049, // -0.49%
                  -0.0049, // -0.49%
                  0.1091, // 10.91%
                  0.1091, // 10.91%
                  0.2231, // 22.31%
                  0.2231, // 22.31%
                  0.3371, // 33.71%
                  0.3371, // 33.71%
                  0.4511, // 45.11%
                  0.4511, // 45.11%
                  0.5651, // 56.51%
                  0.5651, // 56.51%
                  0.6791, // 67.91%
                  0.6791, // 67.91%
                  0.7931, // 79.31%
                ],
              ),
            ),
          ),
          Container(
              width: size.width,
              height: size.height,
              color: const Color(0xff000000).withOpacity(.28),
              alignment: Alignment.center,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      Hero(
                        tag: "1",
                        child: Image.asset("assets/splash.png",
                            width: getWidth(136, context)),
                      ),
                      SizedBox(height: getHeight(32, context)),
                      SizedBox(
                        width: getWidth(168, context),
                        child: const MyText(
                            text: "Connect. Shop. Play.\nEarn with us",
                            fontSize: 14,
                            textAlign: TextAlign.center,
                            color: Color(0xffE6EFF6)),
                      )
                    ],
                  ))),
          Positioned(
              bottom: getHeight(56, context),
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const MyText(
                      text: "All right reserved",
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  SizedBox(height: getHeight(4, context)),
                  const MyText(
                      text: "(c) 2024",
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ],
              ))
        ],
      ),
    );
  }

  _navigateToOnboardingPage() async {
    await Future.delayed(
        const Duration(milliseconds: 3000),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const OnboardingPage()),
            (_) => false));
  }
}
