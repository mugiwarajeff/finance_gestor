import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String imagePath = "lib/assets/images/box.png";
    const double imageSize = 200;
    const String titleText = "Lista Vazia";
    const double titleSize = 32;
    const String bodyText = "Inicie cadastrando uma nova conta";
    const double bodySize = 14;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              imagePath,
              width: imageSize,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            titleText,
            style: TextStyle(fontSize: titleSize),
          ),
          const Text(
            bodyText,
            style: TextStyle(fontSize: bodySize),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
