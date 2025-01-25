import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateLikesNotifier extends StateNotifier<Map<String, bool>> {
  UpdateLikesNotifier() : super({});

  void updateLikes(String id, bool value) {
    state = {
      ...state,
      id: !(state[id] ?? false),
    };
  }
}

final updateLikesNotifier =
    StateNotifierProvider<UpdateLikesNotifier, Map<String, bool>>(
        (ref) => UpdateLikesNotifier());
