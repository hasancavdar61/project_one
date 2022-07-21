import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AdresWidget extends StatelessWidget {
  const AdresWidget({
    Key? key,
    this.iconData,
    this.text,
  }) : super(key: key);

  final IconData? iconData;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10.0,
          ),
          AutoSizeText(
            text!,
            style: const TextStyle(color: Colors.white),
            maxFontSize: 20,
            minFontSize: 8,
          )
        ],
      ),
    );
  }
}
