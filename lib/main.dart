import 'package:flutter/material.dart';
import 'package:projeto_simples_em_flutter/views/Index.dart';

import 'RouteGenerator.dart';

final MaterialColor customColor = MaterialColor(0xFF32B768, {
  50: Color(0xFFF3FBEF),
  100: Color(0xFFE2F4DB),
  200: Color(0xFFC0E9C2),
  300: Color(0xFF9DDDB0),
  400: Color(0xFF7ACF9E),
  500: Color(0xFF58C28B), // Primary color
  600: Color(0xFF51BC84),
  700: Color(0xFF48B676),
  800: Color(0xFF40B06F),
  900: Color(0xFF329E5C),
});

final ThemeData ecotecTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: customColor,
  ),
);

void main() {
  runApp(MaterialApp(
    title: "JOOJ",
    theme: ecotecTheme,
    home: Index(),
    initialRoute: "/index",
    onGenerateRoute: RouteGenerator.generateRoute,
    debugShowCheckedModeBanner: false,
  ));
}

