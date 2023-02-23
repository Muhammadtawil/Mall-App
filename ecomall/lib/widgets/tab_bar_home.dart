import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  HomeTabBar({super.key});

  final List<String> categories = [
    'DarazMall',
    'Flash Sales',
    'Collection',
    'Vouchers',
    'Categories'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.17,
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
            child: Column(
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
