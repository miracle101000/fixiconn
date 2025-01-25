import 'package:fixiconn/model/videostatemodel/current_video_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoControllerProviderNotifier
    extends StateNotifier<CurrentVideoStateModel?> {
  VideoControllerProviderNotifier() : super(null);

  void updateCurrentVideoController(CurrentVideoStateModel? value) {
    state = value;
  }

  void updateCurrentVideoValue(VideoPlayerValue value) {
    state = state?.copyWith(videoPlayerValue: value);
  }
}

final videoControllerProviderNotifier = StateNotifierProvider<
    VideoControllerProviderNotifier,
    CurrentVideoStateModel?>((ref) => VideoControllerProviderNotifier());
