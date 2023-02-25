import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  HomeTabBar({super.key});

  final List<String> categories = [
    'Clothes',
    'Furnitures',
    'Perfumes',
    'Cars',
    'Gifts'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {},
            child: ListView(
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.blue,
                  maxRadius: 30.0,
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(categories[index % categories.length])
              ],
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
