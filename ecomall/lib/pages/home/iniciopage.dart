import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer.dart';
import '../../widgets/searchscreen.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    String searchText = "";
    return MaterialApp(
        title: 'Day / night switcher example',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Color(0xFF253341)),
          scaffoldBackgroundColor: const Color(0xFF15202B),
        ),
        themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        home: Scaffold(
          body: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 63.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                AppDrawer.of(context)?.toggle();
                              },
                              icon: const Icon(Icons.menu, size: 30)),
                          SizedBox(
                              width: 267.0,
                              child: TextField(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchScreen()),
                                  );
                                },
                                onSubmitted: (value) {},
                                controller: searchController,
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: searchText.isNotEmpty
                                      ? IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: () {},
                                        )
                                      : null,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          DayNightSwitcher(
                              isDarkModeEnabled: isDarkModeEnabled,
                              onStateChanged: (_) {
                                setState(() {
                                  isDarkModeEnabled = !isDarkModeEnabled;
                                });
                              }),
                        ],
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(right: 40, top: 55.0, left: 15),
                      child: Text(
                        'Order online collect in store',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 34.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    //Caroussel()
                  ],
                ),
              )),
        ));
  }

  /// Called when the state (day / night) has changed.
  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      isDarkModeEnabled = isDarkModeEnabled;
    });
  }
}
