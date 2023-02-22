import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomerNavBar extends StatelessWidget {
  const CustomerNavBar({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: MediaQuery.of(context).size.height * 0.07,
      backgroundColor: isDarkMode ? Colors.black26 : Colors.white,
      items: <Widget>[
        GestureDetector(
          child: Icon(FontAwesomeIcons.house,
              size: 30, color: isDarkMode ? Colors.white : Colors.black),
        ),
        GestureDetector(
          child: Icon(FontAwesomeIcons.store,
              size: 30, color: isDarkMode ? Colors.white : Colors.black),
        ),
        GestureDetector(
          child: Icon(FontAwesomeIcons.magnifyingGlass,
              size: 30, color: isDarkMode ? Colors.white : Colors.black),
        ),
        GestureDetector(
            child: Icon(
          FontAwesomeIcons.bookmark,
          size: 30,
          color: isDarkMode ? Colors.white : Colors.black,
        )),
        GestureDetector(
          child: Icon(
            FontAwesomeIcons.tags,
            size: 30,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        )
      ],
      onTap: (index) {
        //Handle button tap
      },
      buttonBackgroundColor: isDarkMode
          ? const Color.fromARGB(255, 88, 167, 153)
          : Colors.greenAccent,
      color: isDarkMode
          ? const Color.fromARGB(255, 41, 41, 41)
          : const Color.fromARGB(255, 230, 230, 230),
    );
  }
}
