import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/home/homepage.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': ((context) => const HomeScreen())
    // '/': (BuildContext context) => const AppDrawer(child: HomeScreen()),
    // 'splash': (BuildContext contex) => const Splash(),
    // 'auth': (BuildContext contex) => const Login(),
    // 'favorites': (BuildContext contex) => const NoFavorites(),
    // 'checkout': (BuildContext contex) => const Checkout(),
    // 'busqueda': (BuildContext contex) => const SearchScreen(),
  };
}
