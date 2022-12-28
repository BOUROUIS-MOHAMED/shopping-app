import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/Drinks_section/main_drink_section.dart';
import 'package:shopping_app/Store_interface_section/store_home.dart';

import '../utils/colors.dart';

class ApplicationMap extends StatelessWidget {
  const ApplicationMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(0.05.sw),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    reverseTransitionDuration: Duration(milliseconds: 700),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FadeTransition(

                          opacity: animation,
                          child: StoreHomePage());
                    },));


                },
                child: Container(
                  height: 0.10.sh,
                  width: 0.8.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    color: AppColors.darkGreen
                  ),
                  child: Center(child: Text("Store Home Page",style: GoogleFonts.aldrich(color: Colors.white,fontSize: 0.03.sh,fontWeight: FontWeight.w600),)),
                ),
              )
           ,
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    reverseTransitionDuration: Duration(milliseconds: 700),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FadeTransition(

                          opacity: animation,
                          child: MainDrinkSection());
                    },));


                },
                child: Container(
                  height: 0.10.sh,
                  width: 0.8.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.purpleColor
                  ),
                  child: Center(child: Text("Drink Home Page",style: GoogleFonts.aldrich(color: Colors.white,fontSize: 0.03.sh,fontWeight: FontWeight.w600),)),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
