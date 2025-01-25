import 'package:fixiconn/model/theme/custom_theme.dart';
import 'package:fixiconn/top_level_widget/my_text.dart';
import 'package:fixiconn/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../provider/theme/theme_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = ref.watch(themeNotifierProvider);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    Image.asset(
                        "assets/${theme.themeMode == ThemeMode.light ? "white" : "dark"}_bg.png",
                        width: MediaQuery.of(context).size.width,
                        height: getHeight(360, context),
                        fit: BoxFit.cover),
                    SizedBox(height: getHeight(24.4, context)),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: MyText(
                          text: "Trending",
                          fontSize: 14,
                          color: theme.textColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: getHeight(4, context)),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: MyText(
                          text: "Trending games from 30 days",
                          fontSize: 12,
                          color: theme.textColor),
                    ),
                    SizedBox(height: getHeight(12, context)),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 20),
                          itemBuilder: (_, index) {
                            return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: theme.enabledButtonColor),
                                        ),
                                        MyText(
                                            text: "Game ${index + 1}",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: theme.textColor)
                                      ],
                                    ))));
                          }),
                    ),
                    SizedBox(height: getHeight(32, context)),
                    Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: MyText(
                            text: "Categories",
                            fontSize: 14,
                            color: theme.textColor,
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: getHeight(236, context),
                      child: ListView.builder(
                          itemCount: 6,
                          padding: const EdgeInsets.only(left: 20, top: 12),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                        child: Column(
                                      children: List.generate(
                                          3, (i) => _item(index, i, theme)),
                                    ))));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: MyText(
                          text: "Recently Opened",
                          fontSize: 14,
                          color: theme.textColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: getHeight(4, context)),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: MyText(
                          text: "Here are some of your recently played games",
                          fontSize: 12,
                          color: theme.textColor),
                    ),
                    SizedBox(height: getHeight(12, context)),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 20),
                          itemBuilder: (_, index) {
                            return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: theme.enabledButtonColor),
                                        ),
                                        MyText(
                                            text: "Game ${index + 1}",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: theme.textColor)
                                      ],
                                    ))));
                          }),
                    ),
                    SizedBox(height: getHeight(32, context)),
                  ],
                ),
              )),
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 1),
                  height: 48.5,
                  width: getWidth(375, context),
                  color: const Color(0xffF0F4F8)
                      .withOpacity(theme.textColor != Colors.white ? 0.5 : .1)),
              Container(
                margin: const EdgeInsets.only(bottom: .48),
                height: 56,
                width: getWidth(375, context),
                color: const Color(0xffF0F4F8)
                    .withOpacity(theme.textColor != Colors.white ? 0.5 : .1),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/search-normal.png",
                              width: 24, color: theme.textColor),
                          SizedBox(width: getWidth(9, context)),
                          Image.asset("assets/ranking.png",
                              width: 24, color: theme.textColor),
                          SizedBox(width: getWidth(9, context)),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              ref
                                  .read(themeNotifierProvider.notifier)
                                  .toggleThemeMode();
                            },
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: theme.textColor)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: MyText(
                          text: "Mini Apps",
                          fontSize: 16,
                          color: theme.textColor,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _item(index, int i, CustomTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: getWidth(335, context),
        child: Row(
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.enabledButtonColor),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                      text: "Game${(index + 1) * (i + 1)}",
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: theme.textColor),
                  SizedBox(height: getHeight(4, context)),
                  MyText(
                      text: "Hello game", fontSize: 10, color: theme.textColor),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
