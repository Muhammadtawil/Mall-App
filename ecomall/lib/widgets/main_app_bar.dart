import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'drawer.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      elevation: 0,
      title: Text(
        'Shopii',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
      leading: Consumer(
        builder: (context, ref, child) => IconButton(
            onPressed: () {
              AppDrawer.of(context)?.toggle();
            },
            icon: const Icon(
              Icons.menu,
              size: 30,
            )),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/leb.png',
            ),
            backgroundColor: Colors.white,
            radius: 15,
            // child: Image.asset(
            //   'assets/leb.png',
            //   fit: BoxFit.cover,
            // ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}