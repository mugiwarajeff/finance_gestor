import 'package:finance_gestor/app/features/drawer/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});
  @override
  Widget build(BuildContext context) {
    final String configurationsText =
        AppLocalizations.of(context)!.configurations;

    final String donationText = AppLocalizations.of(context)!.buyMePizza;

    return Drawer(
      child: Column(children: [
        const DrawerHeader(
            child: CircleAvatar(
          maxRadius: 60,
          minRadius: 60,
          child: Icon(Icons.person, size: 64),
        )),
        DrawerItem(
            titleText: configurationsText,
            icon: Icons.settings,
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/configurations");
            }),
        DrawerItem(
            titleText: donationText,
            icon: Icons.local_pizza,
            onTap: () => print("pizza")),
      ]),
    );
  }
}

/**
 * onDestinationSelected: (value) {
        switch (value) {
          case 0:
            Navigator.pop(context);
            Navigator.of(context).pushNamed("/configurations");
            break;
          case 1:
            print("By me a pizza");
            break;
        }
      },
 */