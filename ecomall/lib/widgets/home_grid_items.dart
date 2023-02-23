import 'package:flutter/material.dart';

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
