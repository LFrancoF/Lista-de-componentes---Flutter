import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class CustomCard1 extends StatelessWidget {
  const CustomCard1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album_outlined, color: AppTheme.primaryColor),
            title: Text('Ullamco amet occaecat proident culpa exercitation. Velit exercitation fugiat officia commodo quis nostrud exercitation. Laborum esse non tempor irure consectetur nulla. Sint ea non occaecat deserunt in enim esse. Laboris enim enim aliqua irure.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancel')
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Ok')
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}