import 'package:flutter/material.dart';
import 'package:planet_anim/screen/home/provider/planet_provider.dart';
import 'package:planet_anim/utils/app_routes.dart';
import 'package:planet_anim/utils/theme_data.dart';
import 'package:planet_anim/utils/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: PlanetProvider()),
      ChangeNotifierProvider.value(value: ThemeProvider()),
    ],
    child: Consumer<ThemeProvider>(
      builder: (BuildContext context, value, Widget? child) {
        value.changeThem();
        return MaterialApp(
          theme: value.isLight?darkTheme:lightTheme,
          debugShowCheckedModeBanner: false,
          routes: screen_routes,
        );
      },
    ),
    ),
  );
}
