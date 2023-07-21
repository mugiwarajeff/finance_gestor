import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String imagePath = "lib/app/shared/assets/images/box.png";
    const double imageSize = 200;
    final String titleText = AppLocalizations.of(context)!.emptyList;
    const double titleSize = 32;
    final String bodyText = AppLocalizations.of(context)!.startRecordingBill;
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
          Text(
            titleText,
            style: TextStyle(fontSize: titleSize),
          ),
          Text(
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
