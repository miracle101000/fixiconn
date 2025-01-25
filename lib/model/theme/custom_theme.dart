import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_theme.freezed.dart';

@freezed
class CustomTheme with _$CustomTheme {
  /// Immutable Theme Configuration
  const factory CustomTheme({
    @Default(Colors.white) Color backgroundColor, // App background color
    @Default(Color(0xff1E293B)) Color textColor, // Default text color
    @Default(Color(0xff003366))
    Color enabledButtonColor, // Button color when enabled
    @Default(ThemeMode.system)
    ThemeMode themeMode, // Light/Dark/System theme mode
  }) = _CustomTheme;
}
