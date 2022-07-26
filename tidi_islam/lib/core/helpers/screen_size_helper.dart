import 'package:flutter/material.dart';

/// Ekranın boyutunu kontrol edildiği extansion buradan gelmektedir.

extension ScreenSizeExtensions on BuildContext {
  double screenWitdh({double? width}) =>
      MediaQuery.of(this).size.width * (width ?? 1);
  double screenHeight({double? height}) =>
      MediaQuery.of(this).size.height * (height ?? 1);
}
