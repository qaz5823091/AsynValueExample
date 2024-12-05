import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingleAsyncValueState {
  SingleAsyncValueState({
    required this.username,
    required this.isSelected,
  });

  final AsyncValue<String> username;
  final bool isSelected;

  SingleAsyncValueState copyWith({
    AsyncValue<String>? username,
    bool? isSelected,
  }) {
    return SingleAsyncValueState(
      username: username ?? this.username,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
