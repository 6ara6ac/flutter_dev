import 'package:flutter/material.dart';

final darktTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  dividerColor: Colors.white24,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
      labelSmall: TextStyle(color: Colors.grey, fontSize: 16)),
  useMaterial3: true,
);
