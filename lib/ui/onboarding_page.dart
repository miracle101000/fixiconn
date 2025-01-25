import 'package:fixiconn/top_level_widget/my_text.dart';
import 'package:fixiconn/ui/login.dart';
import 'package:fixiconn/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/splash_bg.png"))),
          ),
          Container(
              width: size.width,
              height: size.height,
              color: const Color(0xff000000).withOpacity(.4)),
          Positioned(
              top: getHeight(12.46, context) +
                  MediaQuery.of(context).viewPadding.top,
              right: getWidth(24, context),
              child: Row(
                children: [
                  const MyText(
                      text: "English", fontSize: 12, color: Colors.white),
                  SizedBox(width: getWidth(4, context)),
                  Image.asset("assets/arrow-down.png", width: 16)
                ],
              )),
          Center(
            child: Hero(
              tag: "1",
              child: Image.asset("assets/splash.png",
                  width: getWidth(171.07, context)),
            ),
          ),
          Positioned(
              bottom: getHeight(57, context),
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getWidth(327, context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _buttons
                          .map<Widget>((text) => _buttonWidget(text))
                          .toList(),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  final List<String> _buttons = ["Log In", "Sign Up"];

  _buttonWidget(String text) {
    Color color = const Color(0xff003366);
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        if (text == "Log In") {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const Login()));
        }
      },
      child: Container(
        width: getWidth(153.5, context),
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: text == "Log In" ? Colors.white : color,
            borderRadius: BorderRadius.circular(8)),
        child: MyText(
            text: text,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: text == "Log In" ? color : Colors.white),
      ),
    );
  }
}
