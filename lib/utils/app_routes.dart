import 'package:flutter/material.dart';
import 'package:planet_anim/screen/detail/view/details_screen.dart';
import 'package:planet_anim/screen/home/view/home_screen.dart';
import 'package:planet_anim/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder> screen_routes ={
  '/':(context) => const SplashScreen(),
  'home':(context) => const HomeScreen(),
  'detail':(context) => const DetailScreen(),
};