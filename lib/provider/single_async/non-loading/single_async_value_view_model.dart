import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_async_value/provider/single_async/non-loading/single_async_value_state.dart';

part 'single_async_value_view_model.g.dart';

@riverpod
class SingleAsyncValueViewModel extends _$SingleAsyncValueViewModel {
  @override
  SingleAsyncValueState build() {
    return SingleAsyncValueState(
      // initial with value
      username: const AsyncValue.data('default'),
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
