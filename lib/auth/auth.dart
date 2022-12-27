import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/configuration/themes/app_colors_hard.dart';

import 'package:shopping_app/configuration/themes/theme_manager.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants/app_constant.dart';
import '../main.dart';





class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override


  Duration get loginTime => Duration(milliseconds: 2250);





  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');

   return Future.delayed(loginTime).then((_) {
     return "";
   /*   if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return 'recovered';*/

    });
  }

  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(0.0),
      top: Radius.circular(0.0),
    );

    return Scaffold(
      appBar: AppBar(

        actions: [

         MaterialButton(

child: Text(
  AdaptiveTheme.of(context).mode.modeName,style: TextStyle(
  color: AppColorsManager.primaryColor
      ,fontSize: 0.02.sh
),
),
             onPressed:  (){

               setState(() {

                 bool isDarkModeActive= AdaptiveTheme.of(context).mode.isDark;

                 isDarkModeActive?
                 AdaptiveTheme.of(context).setLight()
                     :
                 AdaptiveTheme.of(context).setDark();
                 GetStorage().write('ThemeM', isDarkModeActive);

               });

             })
        ],
      ),
      body: FlutterLogin(

        theme: LoginTheme(
        ),
        title: AppConstant.APP_NAME,

        scrollable: false,
        messages: LoginMessages(
         confirmPasswordError: "please check your password confirmation",
          passwordHint: "**********"
        ),
        userType: LoginUserType.email,

        logo: AssetImage('assets/icon/food.png'),
        onLogin: (loginData)=>signIn(loginData),
        onSignup: (signUpData)=>signUp(signUpData),

        footer: "By your inscription, you accept the application low",
        loginAfterSignUp: false,



        loginProviders: <LoginProvider>[
          LoginProvider(
            icon: FontAwesomeIcons.google,
            label: 'Google',
            callback: () async {
              debugPrint('start google sign in');
              await Future.delayed(loginTime);
              debugPrint('stop google sign in');
              return null;
            },
          ),
          LoginProvider(
            icon: FontAwesomeIcons.facebookF,
            label: 'Facebook',
            callback: () async {
              debugPrint('start facebook sign in');
              await Future.delayed(loginTime);
              debugPrint('stop facebook sign in');
              return null;
            },
          ),
        ],
      /*  onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Container(),
          ));
        },*/
        onRecoverPassword: _recoverPassword,
      )
    );

  }

  Future <String?>signIn(LoginData data) async{
    showDialog(context: context,
        barrierDismissible: false,
        builder:(context)=>
            Center(child: CircularProgressIndicator(),)
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data.name.trim(),
          password: data.password.trim());
    } on FirebaseAuthException catch(e){
      print(e);
      showSnackBar(e.toString());
    }
    navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }
  Future<String?> signUp(SignupData data) async{
    showDialog(context: context,
        barrierDismissible: false,
        builder:(context)=>
            Center(child: CircularProgressIndicator(),)
    );
    try{
      

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data.name!.trim(),
          password: data.password!.trim());
      if(FirebaseAuth.instance.currentUser != null){
        FirebaseAuth.instance.currentUser?.updateDisplayName(
            " ");
      }

    }on FirebaseAuthException catch(e){
      print(e);
      showSnackBar(e.toString());
    }

    navigatorKey.currentState!.popUntil((route)=>route.isFirst);
    
  }



  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

}