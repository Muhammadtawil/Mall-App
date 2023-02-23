import 'package:ecomall/widgets/carousel_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/app_theme_provider.dart';
import '../../utilis/titles.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/home_grid_items.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/tab_bar_home.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDarkMode = ref.watch(appThemeProvider);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          appBar: MainAppBar(isDarkMode: isDarkMode),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    width: width,
                    height: height * 0.22,
                    child: VerticalSlider(),
                  ),
                  const TitlesHome(
                    title: 'Top Ranked Shops',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: HomeTabBar(),
                  ),
                  const HomeGridItems(),
                  const TitlesHome(
                    title: 'Nearest shops',
                  ),
                  const HomeGridItems(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CustomerNavBar(isDarkMode: isDarkMode),
        ));
  }
}






          // CircleAvatar(
                  //   radius: 60,
                  //   backgroundColor: Colors.grey,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(1), // Border radius
                  //     child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(60),
                  //         child: Image.asset(
                  //           "assets/ic_profile.jpeg",
                  //           fit: BoxFit.fill,
                  //           width: 120,
                  //           height: 120,
                  //         )),
                  //   ),
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 10, bottom: 60),
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     "Testing User",
                  //     style: Theme.of(context).textTheme.titleLarge,
                  //   ),
                  // ),
                  // ListTile(
                  //   leading:
                  //       Icon(isDarkMode ? Icons.brightness_3 : Icons.sunny),
                  //   title: Text(
                  //     isDarkMode ? "Dark mode" : "Light mode",
                  //     style: Theme.of(context).textTheme.titleSmall,
                  //   ),
                  //   trailing: Consumer(builder: (context, ref, child) {
                  //     return Transform.scale(
                  //       scale: 0.7,
                  //       child: Switch(
                  //         activeColor: Colors.orange,
                  //         onChanged: (value) {
                  //           ref.read(appThemeProvider.notifier).state = value;
                  //         },
                  //         value: isDarkMode,
                  //       ),
                  //     );
                  //   }),
                  // ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.grid_on_sharp,
                  //     color: colors(context).color1,
                  //   ),
                  //   title: Text(
                  //     "Story",
                  //     style: Theme.of(context).textTheme.titleSmall,
                  //   ),
                  // ),
                  // ListTile(
                  //   leading:
                  //       Icon(Icons.settings, color: colors(context).color2),
                  //   title: Text("Settings and Privacy",
                  //       style: Theme.of(context).textTheme.titleSmall),
                  // ),
                  // ListTile(
                  //   leading: Icon(Icons.chat_outlined,
                  //       color: colors(context).color3),
                  //   title: Text(
                  //     "Help Center",
                  //     style: Theme.of(context).textTheme.titleSmall,
                  //   ),
                  // ),
                  // ListTile(
                  //   leading: const Icon(Icons.notifications),
                  //   title: Text(
                  //     "Notification",
                  //     style: Theme.of(context).textTheme.titleSmall,
                  //   ),
                  // ),