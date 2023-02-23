import 'package:flutter/material.dart';

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
