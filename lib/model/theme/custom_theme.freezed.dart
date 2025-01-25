// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomTheme {
  Color get backgroundColor =>
      throw _privateConstructorUsedError; // App background color
  Color get textColor =>
      throw _privateConstructorUsedError; // Default text color
  Color get enabledButtonColor =>
      throw _privateConstructorUsedError; // Button color when enabled
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  /// Create a copy of CustomTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomThemeCopyWith<CustomTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomThemeCopyWith<$Res> {
  factory $CustomThemeCopyWith(
          CustomTheme value, $Res Function(CustomTheme) then) =
      _$CustomThemeCopyWithImpl<$Res, CustomTheme>;
  @useResult
  $Res call(
      {Color backgroundColor,
      Color textColor,
      Color enabledButtonColor,
      ThemeMode themeMode});
}

/// @nodoc
class _$CustomThemeCopyWithImpl<$Res, $Val extends CustomTheme>
    implements $CustomThemeCopyWith<$Res> {
  _$CustomThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? textColor = null,
    Object? enabledButtonColor = null,
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
      enabledButtonColor: null == enabledButtonColor
          ? _value.enabledButtonColor
          : enabledButtonColor // ignore: cast_nullable_to_non_nullable
              as Color,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomThemeImplCopyWith<$Res>
    implements $CustomThemeCopyWith<$Res> {
  factory _$$CustomThemeImplCopyWith(
          _$CustomThemeImpl value, $Res Function(_$CustomThemeImpl) then) =
      __$$CustomThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Color backgroundColor,
      Color textColor,
      Color enabledButtonColor,
      ThemeMode themeMode});
}

/// @nodoc
class __$$CustomThemeImplCopyWithImpl<$Res>
    extends _$CustomThemeCopyWithImpl<$Res, _$CustomThemeImpl>
    implements _$$CustomThemeImplCopyWith<$Res> {
  __$$CustomThemeImplCopyWithImpl(
      _$CustomThemeImpl _value, $Res Function(_$CustomThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? textColor = null,
    Object? enabledButtonColor = null,
    Object? themeMode = null,
  }) {
    return _then(_$CustomThemeImpl(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
      enabledButtonColor: null == enabledButtonColor
          ? _value.enabledButtonColor
          : enabledButtonColor // ignore: cast_nullable_to_non_nullable
              as Color,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$CustomThemeImpl implements _CustomTheme {
  const _$CustomThemeImpl(
      {this.backgroundColor = Colors.white,
      this.textColor = const Color(0xff1E293B),
      this.enabledButtonColor = const Color(0xff003366),
      this.themeMode = ThemeMode.system});

  @override
  @JsonKey()
  final Color backgroundColor;
// App background color
  @override
  @JsonKey()
  final Color textColor;
// Default text color
  @override
  @JsonKey()
  final Color enabledButtonColor;
// Button color when enabled
  @override
  @JsonKey()
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'CustomTheme(backgroundColor: $backgroundColor, textColor: $textColor, enabledButtonColor: $enabledButtonColor, themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomThemeImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.enabledButtonColor, enabledButtonColor) ||
                other.enabledButtonColor == enabledButtonColor) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, backgroundColor, textColor, enabledButtonColor, themeMode);

  /// Create a copy of CustomTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomThemeImplCopyWith<_$CustomThemeImpl> get copyWith =>
      __$$CustomThemeImplCopyWithImpl<_$CustomThemeImpl>(this, _$identity);
}

abstract class _CustomTheme implements CustomTheme {
  const factory _CustomTheme(
      {final Color backgroundColor,
      final Color textColor,
      final Color enabledButtonColor,
      final ThemeMode themeMode}) = _$CustomThemeImpl;

  @override
  Color get backgroundColor; // App background color
  @override
  Color get textColor; // Default text color
  @override
  Color get enabledButtonColor; // Button color when enabled
  @override
  ThemeMode get themeMode;

  /// Create a copy of CustomTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomThemeImplCopyWith<_$CustomThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
