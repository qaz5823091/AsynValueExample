import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_async_value/page/all_async_value_page.dart';
import 'package:test_async_value/page/multiple_async_value_page.dart';
import 'package:test_async_value/page/single_async_value_loading_page.dart';
import 'package:test_async_value/page/single_async_value_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Async Value',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SingleAsyncValuePage(),
                ));
              },
              child: const Text('Single Async Value'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SingleAsyncValueLoadingPage(),
                ));
              },
              child: const Text('Single Async Value with Loading'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AllAsyncValuePage(),
                ));
              },
              child: const Text('All Single Async Value with Loading'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MultipleAsyncValuePage(),
                ));
              },
              child: const Text('Multiple Async Value'),
            ),
          ],
        ),
      ),
    );
  }
}
