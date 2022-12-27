import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/configuration/themes/AppConfiguration.dart';
import 'package:shopping_app/configuration/themes/app_colors_light_mode.dart';
import 'package:shopping_app/configuration/themes/dimensions.dart';

import '../../utils/colors.dart';

class Themes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
      primaryColor: AppColorsLight.primaryColor,
      backgroundColor:AppColorsLight.backgroundColor ,
      scaffoldBackgroundColor: Colors.black12,
      errorColor: AppColors.yellowColor,


    //APP_BAR
/*    appBarTheme: AppBarTheme(
      color: AppColorsLight.appBarColor,
      backgroundColor: AppColorsLight.appBarBackgroundColor,
      centerTitle: AppConfiguration.isAppBarCentered,
      elevation: AppDimensions.appBarElevation,
      foregroundColor:AppColorsLight.appBarForegroundColor,
    ),*/


/*    //BOTTOM_APP_BAR
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColorsLight.bottomAppBarColor,
      elevation: AppDimensions.bottomAppBarElevation,
    ),*/



    //BUTTON
    buttonTheme: ButtonThemeData(
      buttonColor: AppColorsLight.buttonColor,
      disabledColor:AppColorsLight.buttonDisabledColor,
      focusColor: AppColorsLight.buttonFocusColor,
      highlightColor: AppColorsLight.buttonHighlightColor,
      hoverColor: AppColorsLight.buttonHoverColor,
      splashColor: AppColorsLight.buttonSplashColor
    ),



    //TEXT
    textTheme: TextTheme(
      bodyLarge:TextStyle(
        height: AppDimensions.bodyLargeFontSize,
        color: AppColorsLight.bodyLargeColor,
        backgroundColor:AppColorsLight.bodyLargeBackgroundColor ,
        decorationColor: AppColorsLight.bodyLargeDecorationColor,

      )

    )

  );







  //***************************************************************************************************************************//
  //***************************************************************************************************************************//
  //***************************************************************************************************************************//
  //***************************************************************************************************************************//
  //***************************************************************************************************************************//
  //***************************************************************************************************************************//



  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.teal,
      accentColor: Colors.yellow,
      errorColor: AppColors.darkGreen,
      brightness:  Brightness.light




      //APP_BAR
/*    appBarTheme: AppBarTheme(
      color: AppColorsLight.appBarColor,
      backgroundColor: AppColorsLight.appBarBackgroundColor,
      centerTitle: AppConfiguration.isAppBarCentered,
      elevation: AppDimensions.appBarElevation,
      foregroundColor:AppColorsLight.appBarForegroundColor,
    ),*/


/*    //BOTTOM_APP_BAR
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColorsLight.bottomAppBarColor,
      elevation: AppDimensions.bottomAppBarElevation,
    ),*/


,
      //BUTTON
      buttonTheme: ButtonThemeData(
      buttonColor: AppColorsLight.buttonColor,
      disabledColor:AppColorsLight.buttonDisabledColor,
      focusColor: AppColorsLight.buttonFocusColor,
      highlightColor: AppColorsLight.buttonHighlightColor,
      hoverColor: AppColorsLight.buttonHoverColor,
      splashColor: AppColorsLight.buttonSplashColor
  ),



  //TEXT
      textTheme: TextTheme(
  bodyLarge:TextStyle(
  fontSize: AppDimensions.bodyLargeFontSize,

  color: AppColorsLight.bodyLargeColor,
  backgroundColor:AppColorsLight.bodyLargeBackgroundColor ,
  decorationColor: AppColorsLight.bodyLargeDecorationColor,

  )

  )

  );

}


