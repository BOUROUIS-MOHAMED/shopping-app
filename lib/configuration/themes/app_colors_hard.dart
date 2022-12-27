import 'dart:ui';
import 'package:flutter/cupertino.dart';

import 'package:get_storage/get_storage.dart';


class AppColorsLight {
  static const primaryColor = Color(0xFFccc7c5);
  static const backgroundColor = Color(0xffffffff);
  static const scaffoldBackgroundColor = Color(0xffffffff);
}
class AppColorsdark {
  static const primaryColor = Color(0xffff4500);
  static const backgroundColor = Color(0xffff0000);
  static const scaffoldBackgroundColor = Color(0xffff0000);
}
class AppColorsManager extends ChangeNotifier{

  bool T=GetStorage().read("ThemeM");
  static  Color primaryColor =  ( GetStorage().read("ThemeM"))?AppColorsLight.primaryColor:AppColorsdark.primaryColor;
  }