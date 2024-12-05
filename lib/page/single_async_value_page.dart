import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_async_value/provider/single_async/non-loading/single_async_value_view_model.dart';

class SingleAsyncValuePage extends ConsumerStatefulWidget {
  const SingleAsyncValuePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SingleAsyncValuePageState();
}

class _SingleAsyncValuePageState extends ConsumerState<SingleAsyncValuePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(singleAsyncValueViewModelProvider.notifier).init();
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
      final username = ref.watch(singleAsyncValueViewModelProvider).username;
      return username.when(
        data: (data) => Text(data),
        error: (_, __) => const Placeholder(),
        loading: () => const CircularProgressIndicator(),
      );
    });
  }

  Widget _buildSelect() {
    return Consumer(builder: (context, ref, child) {
      final isSelected = ref.watch(singleAsyncValueViewModelProvider).isSelected;
      return Checkbox(
          value: isSelected,
          onChanged: (_) {
            ref.read(singleAsyncValueViewModelProvider.notifier).setSelected();
          });
    });
  }
}
