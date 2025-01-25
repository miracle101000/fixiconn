import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_state_model.freezed.dart';

@freezed
class VideoStateModel with _$VideoStateModel {
  const factory VideoStateModel({
    @Default(0) double aspectRatio,
    @Default(0) double videoHeight,
    @Default(0) double videoWidth,
    @Default(0) double modalValue,
    @Default(true) bool showNavBar,
    @Default(false) bool showComments,
    @Default(false) bool showPause,
  }) = _VideoStateModel;
}
