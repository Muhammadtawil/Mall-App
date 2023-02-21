import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/app_theme_provider.dart';
import 'utilis/routes/route.dart';
import 'utilis/theme/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // set status bar color
    ),
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // set status bar color

    return MaterialApp(
      title: 'Flutter Light/Dark Theme',
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(context, ref.watch(appThemeProvider)),
      routes: getApplicationRoutes(),
    );
  }
}
