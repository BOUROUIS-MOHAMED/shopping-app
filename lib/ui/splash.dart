import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:shopping_app/constants/app_constant.dart';
import '../helpers/directions_handler.dart';
import '../main.dart';
import '../screens/home_management.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    initializeLocationAndSave();
    bool isDarkModeActive= AdaptiveTheme.of(context).mode.isDark;
    GetStorage().write('ThemeM', isDarkModeActive);
  }

  void initializeLocationAndSave() async {
    // Ensure all permissions are collected for Locations
Location _location = Location();
bool? _serviceEnabled;
PermissionStatus? _permissionGranted;
_serviceEnabled = await _location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled=await _location.requestService();
}
_permissionGranted=await _location.hasPermission();
if (_permissionGranted==PermissionStatus.denied) {
  _permissionGranted= await _location.requestPermission();
}

    // Get capture the current user location
LocationData _locationData= await _location.getLocation();
LatLng currentLatLng= LatLng(_locationData.latitude!, _locationData.longitude!);
    // Store the user location in sharedPreferences
sharedPreferences.setDouble('latitude', _locationData.latitude!);
sharedPreferences.setDouble('longitude', _locationData.longitude!);

    // Get and store the directions API response in sharedPreferences


    Future.delayed(
        const Duration(seconds: 1),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeManagement()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
        child: Container(color: Colors.purple,
        child:
        Center(
          child: SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 80.0,
                fontFamily: 'MBF Prime',
              ),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,

                animatedTexts: [
                  TyperAnimatedText(AppConstant.APP_NAME),

                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        )
          ,),
      ),

    );
  }
}
