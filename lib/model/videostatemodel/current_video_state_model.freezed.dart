// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_video_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrentVideoStateModel {
  VideoPlayerValue get videoPlayerValue => throw _privateConstructorUsedError;
  VideoPlayerController get videoPlayerController =>
      throw _privateConstructorUsedError;

  /// Create a copy of CurrentVideoStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentVideoStateModelCopyWith<CurrentVideoStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentVideoStateModelCopyWith<$Res> {
  factory $CurrentVideoStateModelCopyWith(CurrentVideoStateModel value,
          $Res Function(CurrentVideoStateModel) then) =
      _$CurrentVideoStateModelCopyWithImpl<$Res, CurrentVideoStateModel>;
  @useResult
  $Res call(
      {VideoPlayerValue videoPlayerValue,
      VideoPlayerController videoPlayerController});
}

/// @nodoc
class _$CurrentVideoStateModelCopyWithImpl<$Res,
        $Val extends CurrentVideoStateModel>
    implements $CurrentVideoStateModelCopyWith<$Res> {
  _$CurrentVideoStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentVideoStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoPlayerValue = null,
    Object? videoPlayerController = null,
  }) {
    return _then(_value.copyWith(
      videoPlayerValue: null == videoPlayerValue
          ? _value.videoPlayerValue
          : videoPlayerValue // ignore: cast_nullable_to_non_nullable
              as VideoPlayerValue,
      videoPlayerController: null == videoPlayerController
          ? _value.videoPlayerController
          : videoPlayerController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentVideoStateModelImplCopyWith<$Res>
    implements $CurrentVideoStateModelCopyWith<$Res> {
  factory _$$CurrentVideoStateModelImplCopyWith(
          _$CurrentVideoStateModelImpl value,
          $Res Function(_$CurrentVideoStateModelImpl) then) =
      __$$CurrentVideoStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VideoPlayerValue videoPlayerValue,
      VideoPlayerController videoPlayerController});
}

/// @nodoc
class __$$CurrentVideoStateModelImplCopyWithImpl<$Res>
    extends _$CurrentVideoStateModelCopyWithImpl<$Res,
        _$CurrentVideoStateModelImpl>
    implements _$$CurrentVideoStateModelImplCopyWith<$Res> {
  __$$CurrentVideoStateModelImplCopyWithImpl(
      _$CurrentVideoStateModelImpl _value,
      $Res Function(_$CurrentVideoStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentVideoStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoPlayerValue = null,
    Object? videoPlayerController = null,
  }) {
    return _then(_$CurrentVideoStateModelImpl(
      videoPlayerValue: null == videoPlayerValue
          ? _value.videoPlayerValue
          : videoPlayerValue // ignore: cast_nullable_to_non_nullable
              as VideoPlayerValue,
      videoPlayerController: null == videoPlayerController
          ? _value.videoPlayerController
          : videoPlayerController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController,
    ));
  }
}

/// @nodoc

class _$CurrentVideoStateModelImpl extends _CurrentVideoStateModel {
  const _$CurrentVideoStateModelImpl(
      {required this.videoPlayerValue, required this.videoPlayerController})
      : super._();

  @override
  final VideoPlayerValue videoPlayerValue;
  @override
  final VideoPlayerController videoPlayerController;

  @override
  String toString() {
    return 'CurrentVideoStateModel(videoPlayerValue: $videoPlayerValue, videoPlayerController: $videoPlayerController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentVideoStateModelImpl &&
            (identical(other.videoPlayerValue, videoPlayerValue) ||
                other.videoPlayerValue == videoPlayerValue) &&
            (identical(other.videoPlayerController, videoPlayerController) ||
                other.videoPlayerController == videoPlayerController));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, videoPlayerValue, videoPlayerController);

  /// Create a copy of CurrentVideoStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentVideoStateModelImplCopyWith<_$CurrentVideoStateModelImpl>
      get copyWith => __$$CurrentVideoStateModelImplCopyWithImpl<
          _$CurrentVideoStateModelImpl>(this, _$identity);
}

abstract class _CurrentVideoStateModel extends CurrentVideoStateModel {
  const factory _CurrentVideoStateModel(
          {required final VideoPlayerValue videoPlayerValue,
          required final VideoPlayerController videoPlayerController}) =
      _$CurrentVideoStateModelImpl;
  const _CurrentVideoStateModel._() : super._();

  @override
  VideoPlayerValue get videoPlayerValue;
  @override
  VideoPlayerController get videoPlayerController;

  /// Create a copy of CurrentVideoStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentVideoStateModelImplCopyWith<_$CurrentVideoStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
