import 'package:ecomall/pages/home/homepage.dart';
import 'package:ecomall/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, watch, _) => MaterialApp(
        theme: ref.watch(theme),
        darkTheme: ref.watch(darkTheme),
        themeMode: ref.watch(themeMode),
        home: const HomeScreen(),
      ),
    );
  }
}
