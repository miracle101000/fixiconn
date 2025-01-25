import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/videostatemodel/video_state_model.dart';

class VideoStateNotifier extends StateNotifier<VideoStateModel> {
  VideoStateNotifier() : super(const VideoStateModel());

  void updateAspectRatio(double value) {
    state = state.copyWith(aspectRatio: value);
  }

  void updateVideoHeight(double value) {
    state = state.copyWith(videoHeight: value);
  }

  void updateVideoWidth(double value) {
    state = state.copyWith(videoWidth: value);
  }

  void updateModalValue(double value) {
    state = state.copyWith(modalValue: value);
  }

  void updateShowNavBar(bool value) {
    state = state.copyWith(showNavBar: false);
  }

  void updateShowComments(bool value) {
    state = state.copyWith(showComments: value);
  }

  void updateShowPauesButton(bool value) {
    state = state.copyWith(showPause: value);
  }
}

final videoStateNotifier =
    StateNotifierProvider<VideoStateNotifier, VideoStateModel>(
        (ref) => VideoStateNotifier());
