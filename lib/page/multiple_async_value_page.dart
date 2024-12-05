import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_async_value/provider/multiple_async/multiple_async_value_view_model.dart';

class MultipleAsyncValuePage extends ConsumerStatefulWidget {
  const MultipleAsyncValuePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MultipleAsyncValuePageState();
}

class _MultipleAsyncValuePageState extends ConsumerState<MultipleAsyncValuePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(multipleAsyncValueViewModelProvider.notifier).init();
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
              _buildText1(),
              _buildText2(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    return Consumer(builder: (context, ref, child) {
      final username = ref.watch(multipleAsyncValueViewModelProvider).username;
      return username.when(
        data: (data) => Text(data),
        error: (_, __) => const Text('What'),
        loading: () => const CircularProgressIndicator(),
      );
    });
  }

  Widget _buildText1() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text('...'),
    );
  }

  Widget _buildText2() {
    return Consumer(builder: (context, ref, child) {
      final email = ref.watch(multipleAsyncValueViewModelProvider).email;
      return email.when(
        data: (data) => Text(data),
        error: (_, __) => const Text('What'),
        loading: () => const CircularProgressIndicator(),
      );
    });
  }
}
