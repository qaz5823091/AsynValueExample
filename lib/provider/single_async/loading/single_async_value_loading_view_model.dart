import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_async_value/provider/single_async/non-loading/single_async_value_state.dart';

part 'single_async_value_loading_view_model.g.dart';

@riverpod
class SingleAsyncValueLoadingViewModel extends _$SingleAsyncValueLoadingViewModel {
  @override
  SingleAsyncValueState build() {
    return SingleAsyncValueState(
      // initial with loading
      username: const AsyncLoading(),
      isSelected: false,
    );
  }

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    state = state.copyWith(username: const AsyncValue.data('Steven YE'));
  }

  void setSelected() {
    state = state.copyWith(isSelected: !state.isSelected);
  }
}
