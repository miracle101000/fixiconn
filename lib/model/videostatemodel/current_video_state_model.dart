import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

part 'current_video_state_model.freezed.dart';

@freezed
class CurrentVideoStateModel with _$CurrentVideoStateModel {
  const factory CurrentVideoStateModel({
    required VideoPlayerValue videoPlayerValue,
    required VideoPlayerController videoPlayerController,
  }) = _CurrentVideoStateModel;

  const CurrentVideoStateModel._();

  /// Convenience getters
  bool get isPlaying => videoPlayerValue.isPlaying;
  bool get isBuffering => videoPlayerValue.isBuffering;
  Duration get currentPosition => videoPlayerValue.position;
  Duration get totalDuration => videoPlayerValue.duration;
}
