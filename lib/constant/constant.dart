import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0xFF53B175);
  static const Color darkPrimary = Color(0xFF388E3C);
  static const Color lightPrimary = Color(0xFF81C784);
  static const Color grey = Color(0xFF707070);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color error = Color(0xFFFF0000);
  static const Color lightGrey = Color(0xFFEFEFEF);
  static const Color primaryContent = Color(0xfFd93b74);
}

class TextManager {
  static const TextStyle h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
}
