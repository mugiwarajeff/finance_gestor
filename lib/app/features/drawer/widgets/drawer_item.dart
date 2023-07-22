import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String titleText;
  final IconData icon;
  final void Function() onTap;

  const DrawerItem(
      {super.key,
      required this.titleText,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color cardColor = Theme.of(context).colorScheme.secondaryContainer;
    final Color contentCardColor =
        Theme.of(context).colorScheme.onSecondaryContainer;

    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Card(
        color: cardColor,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
        child: Align(
          alignment: Alignment.center,
          child: ListTile(
            onTap: onTap,
            leading: Icon(
              icon,
              color: contentCardColor,
            ),
            title: Text(
              titleText,
              style: TextStyle(color: contentCardColor),
            ),
          ),
        ),
      ),
    );
  }
}
