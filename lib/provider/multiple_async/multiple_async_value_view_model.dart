import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_async_value/provider/multiple_async/multiple_async_value_state.dart';

part 'multiple_async_value_view_model.g.dart';

@riverpod
class MultipleAsyncValueViewModel extends _$MultipleAsyncValueViewModel {
  @override
  MultipleAsyncValueState build() {
    return MultipleAsyncValueState(
      username: const AsyncLoading(),
      email: const AsyncLoading(),
    );
  }

  Future<void> init() async {
    _initUsername();
    _initEmail();
  }

  Future<void> _initUsername() async {
    state = state.copyWith(username: const AsyncLoading());
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(username: const AsyncData('Steven YE'));
  }

  Future<void> _initEmail() async {
    state = state.copyWith(email: const AsyncLoading());
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(email: const AsyncData('steven@program.com.tw'));
  }
}
