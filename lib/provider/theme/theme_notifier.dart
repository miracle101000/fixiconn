import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/theme/custom_theme.dart';

class ThemeNotifier extends StateNotifier<CustomTheme> {
  ThemeNotifier()
      : super(const CustomTheme(
            backgroundColor: Colors.white,
            textColor: Color(0xff1E293B),
            themeMode: ThemeMode.light));

  void toggleThemeMode() {
    if (state.themeMode == ThemeMode.light) {
      state = const CustomTheme(
          backgroundColor: Color(0xff0F172A),
          textColor: Colors.white,
          themeMode: ThemeMode.dark);
    } else {
      state = const CustomTheme(
          backgroundColor: Colors.white,
          textColor: Color(0xff1F2A37),
          themeMode: ThemeMode.light);
    }
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, CustomTheme>(
  (ref) => ThemeNotifier(),
);
