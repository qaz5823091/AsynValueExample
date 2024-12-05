import 'package:flutter_riverpod/flutter_riverpod.dart';

class MultipleAsyncValueState {
  MultipleAsyncValueState({
    required this.username,
    required this.email,
  });

  final AsyncValue<String> username;
  final AsyncValue<String> email;

  MultipleAsyncValueState copyWith({
    AsyncValue<String>? username,
    AsyncValue<String>? email,
  }) {
    return MultipleAsyncValueState(
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }
}
