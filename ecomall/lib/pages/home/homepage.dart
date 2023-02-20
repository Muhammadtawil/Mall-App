import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bettercoding.dev – theming'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Text(
              'Welcome!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'This is a tutorial about theming.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Spacer(),
            const Spacer(),
            ElevatedButton(
              child: const Text('Click me!'),
              onPressed: () {
                // final state = ref.watch(themeMode);
                // ref.watch(themeMode) ==state== ThemeMode.light
                //     ? ThemeMode.dark
                //     : ThemeMode.light;
              },
            )
          ],
        ),
      ),
    );
  }
}
