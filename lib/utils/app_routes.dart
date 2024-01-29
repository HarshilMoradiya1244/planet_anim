import 'package:flutter/material.dart';
import 'package:planet_anim/screen/home/view/details_screen.dart';
import 'package:planet_anim/screen/home/view/home_screen.dart';
import 'package:planet_anim/screen/home/view/splash_screen.dart';

Map<String,WidgetBuilder> screen_routes ={
  '/':(context) => const SplashScreen(),
  'home':(context) => const HomeScreen(),
  'detail':(context) => const DetailScreen(),
};