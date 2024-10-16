import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavState {
  final int currentIndex;
  final String? currentTitle;

  BottomNavState({
    required this.currentIndex,
    this.currentTitle,
  });
}

class BottomNavNotifier extends StateNotifier<BottomNavState> {
  BottomNavNotifier() : super(BottomNavState(currentIndex: 0, currentTitle: "Home"));

  void setIndex(int index,String? title) {
    state = BottomNavState(
      currentIndex: index,
      currentTitle: title
    );
  }
}

// Define the provider
final bottomNavProvider = StateNotifierProvider<BottomNavNotifier, BottomNavState>(
      (ref) => BottomNavNotifier(),
);
