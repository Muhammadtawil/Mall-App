import 'package:ecomall/widgets/carousel_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/app_theme_provider.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/tab_bar_home.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDarkMode = ref.watch(appThemeProvider);

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
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.22,
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

class TitlesHome extends StatelessWidget {
  const TitlesHome({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          TextButton(onPressed: () {}, child: const Text('See all'))
        ],
      ),
    );
  }
}

class HomeGridItems extends StatelessWidget {
  const HomeGridItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6, // The number of items in the grid
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // The number of columns in the grid
          mainAxisSpacing: 10.0, // The spacing between each item vertically
          crossAxisSpacing: 10.0, // The spacing between each item horizontally
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              color: const Color.fromARGB(
                255,
                108,
                136,
                110,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text('Item $index'), // The content of each item
            ),
          );
        },
      ),
    );
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