import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/Drinks_section/main_drink_section.dart';
import 'package:shopping_app/Store_interface_section/store_home.dart';
import 'package:shopping_app/ui/splash.dart';


import 'configuration/themes/theme_manager.dart';
import 'package:get/get.dart';

late SharedPreferences sharedPreferences;

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();

  final savedThemeMode = await AdaptiveTheme.getThemeMode()??AdaptiveThemeMode.light;
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp( MyApp(savedThemeMode: savedThemeMode, onChanged: () {  },));
}
final navigatorKey = GlobalKey<NavigatorState>();



class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final VoidCallback onChanged;


  const MyApp({
    Key? key,
    this.savedThemeMode,
    required this.onChanged}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String islight = savedThemeMode!.modeName;
    print(islight);

    GetStorage().write('themeModeStatus', islight);
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: ((context, child) {
          return AdaptiveTheme(

              light: Themes.lightTheme,
              dark: Themes.darkTheme,
              initial:AdaptiveThemeMode.light,
              // savedThemeMode ?? AdaptiveThemeMode.light,

              builder: (theme, darkTheme) =>
              (
                  ScreenUtilInit(
                      designSize: const Size(360, 690),
                      builder: ((context, child) {
                        return MaterialApp(

                            theme: theme,
                            darkTheme: darkTheme,

                            navigatorKey: navigatorKey,
                            title: 'Mapbox Flutter',
                            //theme managmement

                            debugShowCheckedModeBanner: false,


                            home: StoreHomePage()
                          // MainDrinkSection()
                        );
                      }))
              ));
        }));
  }
}
