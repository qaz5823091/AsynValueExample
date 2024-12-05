import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_async_value/provider/all_async/all_async_value_state.dart';

part 'all_async_value_view_model.g.dart';

@riverpod
class AllAsyncValueViewModel extends _$AllAsyncValueViewModel {
  @override
  AllAsyncValueState build() {
    return AllAsyncValueState(state: const AsyncLoading());
  }

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    final current = state.state.value?.isSelected ?? false;
    state = state.copyWith(state: AsyncData(AllAsyncState(username: 'Steven Ye', isSelected: current)));
  }

  void setSelected() {
    final isSelected = state.state.value!.isSelected;
    state = state.copyWith(state: AsyncData(state.state.value!.copyWith(isSelected: !isSelected)));
  }
}
