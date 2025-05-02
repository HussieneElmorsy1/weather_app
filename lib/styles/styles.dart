import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

//*********TEXT********** */

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: Colors.grey,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontStyle: FontStyle.italic,
    color: Colors.grey,
  );
}
//*********COLORS********** */

class AppColors {
  static const Color primaryColor = Color(0xFF0A3D62);
  static const Color accentColor = Color(0xFFF5C33B);
  static const Color backgroundColor = Color(0xFFF7F8FA);
  static const Color textColor = Color(0xFF4A4A4A);
  static const Color white = Colors.white;
}
//*********Spacing********** */

class AppSpacing {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double xLarge = 32.0;
}

class AppGaping {
  static const kGap0 = Gap(0);
  static const kGap5 = Gap(5);
  static const kGap8 = Gap(8);
  static const kGap10 = Gap(10);
  static const kGap15 = Gap(15);
  static const kGap20 = Gap(20);
  static const kGap25 = Gap(25);
  static const kGap30 = Gap(30);
  static const kGap32 = Gap(32);
  static const kGap40 = Gap(40);
  static const kGap50 = Gap(50);
  static const kGap60 = Gap(60);
  static const kGap100 = Gap(100);
}

//*********Borders and Shadows********** */

class AppBorders {
  static const BorderRadius buttonRadius = BorderRadius.all(Radius.circular(8));
  static const Border cardBorder = Border(
    top: BorderSide(color: Colors.grey, width: 1),
    bottom: BorderSide(color: Colors.grey, width: 1),
  );
}


