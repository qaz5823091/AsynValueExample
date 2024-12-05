import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_async_value/provider/all_async/all_async_value_view_model.dart';

class AllAsyncValuePage extends ConsumerStatefulWidget {
  const AllAsyncValuePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllAsyncValuePageState();
}

class _AllAsyncValuePageState extends ConsumerState<AllAsyncValuePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(allAsyncValueViewModelProvider.notifier).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildText(),
              _buildSelect(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(allAsyncValueViewModelProvider).state;
      return state.when(
        data: (data) => Text(data.username),
        error: (_, __) => const Placeholder(),
        loading: () => const CircularProgressIndicator(),
      );
    });
  }

  Widget _buildSelect() {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(allAsyncValueViewModelProvider).state;
      return state.when(
        data: (data) => Checkbox(
            value: data.isSelected,
            onChanged: (_) {
              ref.read(allAsyncValueViewModelProvider.notifier).setSelected();
            }),
        error: (_, __) => const Placeholder(),
        loading: () => const CircularProgressIndicator(),
      );
    });
  }
}
