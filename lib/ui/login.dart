import 'package:fixiconn/top_level_widget/custom_text_field.dart';
import 'package:fixiconn/ui/landing.dart';
import 'package:fixiconn/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/theme/theme_notifier.dart';
import '../top_level_widget/my_text.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;
  String? _usernameErrorMessage;
  String? _passwordErrorMessage;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifierProvider);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
                height: getHeight(44, context) +
                    MediaQuery.of(context).viewPadding.top),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.pop(context),
                        child: Image.asset("assets/arrow-left.png", width: 24)))
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      SizedBox(height: getHeight(64, context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                              tag: "1",
                              child: Image.asset("assets/splash.png",
                                  width: getWidth(113.62, context),
                                  color: const Color(0xff00448C)))
                        ],
                      ),
                      SizedBox(height: getHeight(64, context)),
                      _title("Username"),
                      CustomTextField(
                          controller: _usernameController,
                          theme: theme,
                          hintText: "",
                          enabledBorder: true,
                          width: getWidth(335, context)),
                      SizedBox(height: getHeight(4, context)),
                      if (_usernameErrorMessage != null)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: MyText(
                                  text: _usernameErrorMessage!,
                                  color: Colors.red.shade800,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      SizedBox(height: getHeight(16, context)),
                      _title("Password"),
                      CustomTextField(
                        controller: _passwordController,
                        theme: theme,
                        hintText: "",
                        maxLines: 1,
                        isPassword: true,
                        type: TextInputType.visiblePassword,
                        obscureText: obscureText,
                        enabledBorder: true,
                        width: getWidth(335, context),
                        hasSuffix: true,
                        suffixPath: "assets/eye.png",
                        onTapSuffix: () {
                          obscureText = !obscureText;
                          setState(() {});
                        },
                      ),
                      SizedBox(height: getHeight(4, context)),
                      if (_passwordErrorMessage != null)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: MyText(
                                  text: _passwordErrorMessage!,
                                  color: Colors.red.shade800,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      SizedBox(height: getHeight(28, context)),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: _validateAndNavigate,
                        child: Container(
                          width: getWidth(335, context),
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xff003366),
                              borderRadius: BorderRadius.circular(8)),
                          child: const MyText(
                              text: "Log in",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: getHeight(20, context)),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                              text: "Forgotten Password?",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff003366))
                        ],
                      ),
                      SizedBox(height: getHeight(150, context)),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: _validateAndNavigate,
                        child: Container(
                            width: getWidth(335, context),
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(8)),
                            child: const MyText(
                                text: "Create new account",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff003366))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 6),
      child: Row(
        children: [
          Text.rich(TextSpan(
              text: text,
              style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff1E293B)),
              children: [
                TextSpan(
                  text: "*",
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffB3261E)),
                )
              ]))
        ],
      ),
    );
  }

  void _validateAndNavigate() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Validate username
    if (username.isEmpty || username.length <= 4) {
      setState(() {
        _usernameErrorMessage = "Username must be more than 4 characters long";
      });
      return;
    } else {
      setState(() {
        _usernameErrorMessage = null;
      });
    }

    // Validate password
    if (password.isEmpty || !passwordRegex.hasMatch(password)) {
      setState(() {
        _passwordErrorMessage =
            "Password must be at least 8 characters long, include\nuppercase, lowercase, digit, and special character.";
      });
      return;
    } else {
      setState(() {
        _passwordErrorMessage = null;
      });
    }

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Landing()),
        (route) => false);
  }
}
