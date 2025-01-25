import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentReelsPageNotifier extends StateNotifier<int> {
  CurrentReelsPageNotifier() : super(2);

  void updateCurrentPageIndex(int value) {
    state = value;
  }
}

final currentReelsPageNotifier =
    StateNotifierProvider<CurrentReelsPageNotifier, int>(
  (ref) => CurrentReelsPageNotifier(),
);
