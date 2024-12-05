import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllAsyncValueState {
  AllAsyncValueState({
    required this.state,
  });

  final AsyncValue<AllAsyncState> state;

  AllAsyncValueState copyWith({
    AsyncValue<AllAsyncState>? state,
  }) {
    return AllAsyncValueState(state: state ?? this.state);
  }
}

class AllAsyncState {
  AllAsyncState({
    required this.username,
    required this.isSelected,
  });

  final String username;
  final bool isSelected;

  AllAsyncState copyWith({
    String? username,
    bool? isSelected,
  }) {
    return AllAsyncState(
      username: username ?? this.username,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
