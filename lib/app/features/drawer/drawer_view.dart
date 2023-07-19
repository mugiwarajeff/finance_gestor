import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (value) {
        switch (value) {
          case 0:
            Navigator.pop(context);
            Navigator.of(context).pushNamed("/configurations");
            break;
        }
      },
      children: const [
        DrawerHeader(
            child: CircleAvatar(
          maxRadius: 10,
          minRadius: 10,
          child: Icon(Icons.person, size: 64),
        )),
        NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text("Configurations"),
        )
      ],
    );
  }
}
