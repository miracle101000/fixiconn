// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoStateModel {
  double get aspectRatio => throw _privateConstructorUsedError;
  double get videoHeight => throw _privateConstructorUsedError;
  double get videoWidth => throw _privateConstructorUsedError;
  double get modalValue => throw _privateConstructorUsedError;
  bool get showNavBar => throw _privateConstructorUsedError;
  bool get showComments => throw _privateConstructorUsedError;
  bool get showPause => throw _privateConstructorUsedError;

  /// Create a copy of VideoStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoStateModelCopyWith<VideoStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoStateModelCopyWith<$Res> {
  factory $VideoStateModelCopyWith(
          VideoStateModel value, $Res Function(VideoStateModel) then) =
      _$VideoStateModelCopyWithImpl<$Res, VideoStateModel>;
  @useResult
  $Res call(
      {double aspectRatio,
      double videoHeight,
      double videoWidth,
      double modalValue,
      bool showNavBar,
      bool showComments,
      bool showPause});
}

/// @nodoc
class _$VideoStateModelCopyWithImpl<$Res, $Val extends VideoStateModel>
    implements $VideoStateModelCopyWith<$Res> {
  _$VideoStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aspectRatio = null,
    Object? videoHeight = null,
    Object? videoWidth = null,
    Object? modalValue = null,
    Object? showNavBar = null,
    Object? showComments = null,
    Object? showPause = null,
  }) {
    return _then(_value.copyWith(
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      videoHeight: null == videoHeight
          ? _value.videoHeight
          : videoHeight // ignore: cast_nullable_to_non_nullable
              as double,
      videoWidth: null == videoWidth
          ? _value.videoWidth
          : videoWidth // ignore: cast_nullable_to_non_nullable
              as double,
      modalValue: null == modalValue
          ? _value.modalValue
          : modalValue // ignore: cast_nullable_to_non_nullable
              as double,
      showNavBar: null == showNavBar
          ? _value.showNavBar
          : showNavBar // ignore: cast_nullable_to_non_nullable
              as bool,
      showComments: null == showComments
          ? _value.showComments
          : showComments // ignore: cast_nullable_to_non_nullable
              as bool,
      showPause: null == showPause
          ? _value.showPause
          : showPause // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoStateModelImplCopyWith<$Res>
    implements $VideoStateModelCopyWith<$Res> {
  factory _$$VideoStateModelImplCopyWith(_$VideoStateModelImpl value,
          $Res Function(_$VideoStateModelImpl) then) =
      __$$VideoStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double aspectRatio,
      double videoHeight,
      double videoWidth,
      double modalValue,
      bool showNavBar,
      bool showComments,
      bool showPause});
}

/// @nodoc
class __$$VideoStateModelImplCopyWithImpl<$Res>
    extends _$VideoStateModelCopyWithImpl<$Res, _$VideoStateModelImpl>
    implements _$$VideoStateModelImplCopyWith<$Res> {
  __$$VideoStateModelImplCopyWithImpl(
      _$VideoStateModelImpl _value, $Res Function(_$VideoStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aspectRatio = null,
    Object? videoHeight = null,
    Object? videoWidth = null,
    Object? modalValue = null,
    Object? showNavBar = null,
    Object? showComments = null,
    Object? showPause = null,
  }) {
    return _then(_$VideoStateModelImpl(
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      videoHeight: null == videoHeight
          ? _value.videoHeight
          : videoHeight // ignore: cast_nullable_to_non_nullable
              as double,
      videoWidth: null == videoWidth
          ? _value.videoWidth
          : videoWidth // ignore: cast_nullable_to_non_nullable
              as double,
      modalValue: null == modalValue
          ? _value.modalValue
          : modalValue // ignore: cast_nullable_to_non_nullable
              as double,
      showNavBar: null == showNavBar
          ? _value.showNavBar
          : showNavBar // ignore: cast_nullable_to_non_nullable
              as bool,
      showComments: null == showComments
          ? _value.showComments
          : showComments // ignore: cast_nullable_to_non_nullable
              as bool,
      showPause: null == showPause
          ? _value.showPause
          : showPause // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VideoStateModelImpl implements _VideoStateModel {
  const _$VideoStateModelImpl(
      {this.aspectRatio = 0,
      this.videoHeight = 0,
      this.videoWidth = 0,
      this.modalValue = 0,
      this.showNavBar = true,
      this.showComments = false,
      this.showPause = false});

  @override
  @JsonKey()
  final double aspectRatio;
  @override
  @JsonKey()
  final double videoHeight;
  @override
  @JsonKey()
  final double videoWidth;
  @override
  @JsonKey()
  final double modalValue;
  @override
  @JsonKey()
  final bool showNavBar;
  @override
  @JsonKey()
  final bool showComments;
  @override
  @JsonKey()
  final bool showPause;

  @override
  String toString() {
    return 'VideoStateModel(aspectRatio: $aspectRatio, videoHeight: $videoHeight, videoWidth: $videoWidth, modalValue: $modalValue, showNavBar: $showNavBar, showComments: $showComments, showPause: $showPause)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoStateModelImpl &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.videoHeight, videoHeight) ||
                other.videoHeight == videoHeight) &&
            (identical(other.videoWidth, videoWidth) ||
                other.videoWidth == videoWidth) &&
            (identical(other.modalValue, modalValue) ||
                other.modalValue == modalValue) &&
            (identical(other.showNavBar, showNavBar) ||
                other.showNavBar == showNavBar) &&
            (identical(other.showComments, showComments) ||
                other.showComments == showComments) &&
            (identical(other.showPause, showPause) ||
                other.showPause == showPause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, aspectRatio, videoHeight,
      videoWidth, modalValue, showNavBar, showComments, showPause);

  /// Create a copy of VideoStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoStateModelImplCopyWith<_$VideoStateModelImpl> get copyWith =>
      __$$VideoStateModelImplCopyWithImpl<_$VideoStateModelImpl>(
          this, _$identity);
}

abstract class _VideoStateModel implements VideoStateModel {
  const factory _VideoStateModel(
      {final double aspectRatio,
      final double videoHeight,
      final double videoWidth,
      final double modalValue,
      final bool showNavBar,
      final bool showComments,
      final bool showPause}) = _$VideoStateModelImpl;

  @override
  double get aspectRatio;
  @override
  double get videoHeight;
  @override
  double get videoWidth;
  @override
  double get modalValue;
  @override
  bool get showNavBar;
  @override
  bool get showComments;
  @override
  bool get showPause;

  /// Create a copy of VideoStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoStateModelImplCopyWith<_$VideoStateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
