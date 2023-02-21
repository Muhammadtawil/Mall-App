import 'package:ecomall/pages/home/home_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const AppDrawer(child: MyHomePage()),
    // 'splash': (BuildContext contex) => const Splash(),
    // 'auth': (BuildContext contex) => const Login(),
    // 'favorites': (BuildContext contex) => const NoFavorites(),
    // 'checkout': (BuildContext contex) => const Checkout(),
    // 'busqueda': (BuildContext contex) => const SearchScreen(),
  };
}
