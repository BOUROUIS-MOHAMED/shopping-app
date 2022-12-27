import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/Drinks_section/drink_concept_list.dart';
import 'package:shopping_app/Drinks_section/drinks.dart';
import 'package:shopping_app/constants/app_constant.dart';
import 'package:shopping_app/utils/colors.dart';

class DrinkConceptHome extends StatelessWidget {
  const DrinkConceptHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,

          elevation: 0,
          leading: Icon(
            FontAwesomeIcons.chevronLeft,color: Colors.black,
          ),
          actions: [
      Padding(
      padding:  EdgeInsets.only(right:0.05.sw),
      child: Icon(
        Icons.shopping_bag_outlined,color: Colors.black,
      ),
    ),]),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
if(details.primaryDelta! < -20){
  Navigator.of(context).push(PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) {
    return FadeTransition(opacity: animation,
    child: DrinkConceptList(),

    );
  },));
}
        },

        child: Stack(
          children: [
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.brown.shade300,
                      Colors.white,
                    ],
                  )
                ),
              ),
            ),
            Positioned(
                height: 0.5.sh,
                left: 0,
                right: 0,
                bottom:0.2.sh,
                child:Hero(
                  tag: '7',
                  child: Image.asset(
                    drinks[6].image,

                  ),

                ) ),
            Positioned(
                height: 0.6.sh,
                left: 0,
                right: 0,
                bottom: -0.1.sh,
                child:Hero(
                  tag: '8',
                  child: Image.asset(
                    drinks[7].image,
                    fit: BoxFit.cover,
                  ),

                ) ),
            Positioned(
                height: 0.8.sh,
                left: 0,
                right: 0,
                bottom: -0.7.sh,
                child:Hero(
                  tag: '9',
                  child: Image.asset(
                    drinks[8].image,
                    fit: BoxFit.cover,
                  ),

                ) ),
            Positioned(
              height: 0.24.sh,
              left: 0,
              right: 0,
              bottom: 0.05.sh,
              child: Center(
                child: Column(
                  children: [
                    Text("SCROLL UP \n",style: GoogleFonts.orbitron(fontSize: 0.04 .sh,color: Colors.white),textAlign: TextAlign.center,),
                   Icon(
                          FontAwesomeIcons.chevronDown,
                         color: Colors.white,size: 20),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
