import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 1,
      //bottom navigation bar on scaffold
      color: const Color.fromARGB(255, 236, 234, 234),
      shape: const CircularNotchedRectangle(), //shape of notch
      notchMargin: 5, //notche margin between floating button and bottom appbar
      child: Row(
        //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.house,
              color: Colors.grey,
            ),
            onPressed: () {
              // Navigator.of(context).pushNamed(HomePage.routeName);
            },
          ),
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.fileShield,
              color: Colors.grey,
            ),
            onPressed: () {
              // Navigator.of(context)
              // .pushReplacementNamed(CollectionScreen.routeName);
            },
          ),
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.inbox,
              color: Colors.grey,
            ),
            onPressed: () {
              // Provider.of<Auth>(context, listen: false).logout();
              // Navigator.of(context).pushNamed(CollectionsDropDown.routeName);
            },
          ),
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.gear,
              color: Colors.grey,
            ),
            onPressed: () {
              // Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
