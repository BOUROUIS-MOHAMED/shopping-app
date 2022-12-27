import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/Drinks_section/drink_concept_detail.dart';
import 'package:shopping_app/Drinks_section/drinks.dart';
import 'package:shopping_app/configuration/themes/app_colors_hard.dart';
import 'package:shopping_app/utils/colors.dart';

const _duration =Duration(milliseconds: 500);
const _initialPage=7;
class DrinkConceptList extends StatefulWidget {
  const DrinkConceptList({Key? key}) : super(key: key);
  @override
  State<DrinkConceptList> createState() => _DrinkConceptListState();
}
class _DrinkConceptListState extends State<DrinkConceptList> {
final _pageTextController=PageController(
  initialPage: _initialPage

);
  double _currentPage=_initialPage.toDouble();

double _textPage=0.0;
  final _pageDrinkController= PageController(
    initialPage: _initialPage,
    viewportFraction: 0.35,);

void _drinkScrollListener(){
setState(() {
  _currentPage= _pageDrinkController!.page!;
});}

void _textScrollListener(){
  _textPage=_currentPage;
}
  @override
  void initState() {
_pageDrinkController.addListener(_drinkScrollListener);
_pageTextController.addListener(_textScrollListener);
    super.initState();}

  @override
  void dispose() {
    _pageDrinkController.removeListener(_drinkScrollListener);
    _pageTextController.removeListener(_textScrollListener);
    _pageDrinkController.dispose();
    _pageTextController.dispose();
    super.dispose();}

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async =>false,
      child: Scaffold(
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
            ),
          ],
        ),
       body: Column(
         children: [
           SizedBox(height: 0.1.sh,),
           Container(
             height: 0.9.sh,
             width: 1.sw,
             child: Stack(
               children: [
                 Positioned(
               left:20,
               right: 20,
                   bottom: -0.2.sh,
                   height: 0.3.sh,
                   child: DecoratedBox(
                   decoration: BoxDecoration(
                     shape: BoxShape.rectangle,
                     boxShadow:[ BoxShadow(
                       color: Colors.brown.shade300,
                       blurRadius:  200,
                       offset: Offset.zero,
                       spreadRadius: 0.15 .sh
                     )
                     ]
                   ),
                   ),
                     ),

                 Transform.scale(
                   scale: 1.6,
                   alignment: Alignment.bottomCenter,
                   child: PageView.builder(
                     controller: _pageDrinkController,
                     scrollDirection: Axis.vertical,
                       itemCount: drinks.length,
                       onPageChanged: (value) {
                         if(value<drinks.length){
                           _pageTextController.animateToPage
                             (value,
                               duration: _duration,
                               curve: Curves.easeOut);

                         }
                       },
                       itemBuilder: ((context, index) {

                         if(index==0){
                           return SizedBox.shrink();
                         }

                     final drink=drinks[index-1];
                         final result=_currentPage-index+1;
                         final value= -0.4*result+1;
                         final opacity = value.clamp(0.0, 1.0);



                     return GestureDetector(
                         onTap: (){
                           Navigator.of(context).push(PageRouteBuilder(
                               transitionDuration: const Duration(milliseconds: 600),
                               pageBuilder: (context, animation, secondaryAnimation) {
                                 return FadeTransition(opacity: animation,
                                     child: DrinkConceptDetails(drink:drink));
                               }),);},
                       child: Padding(
                         padding: EdgeInsets.only(bottom: 0.03.sh),
                         child: Transform(
                           alignment: Alignment.bottomCenter,
                             transform: Matrix4.identity()
                               ..setEntry(3, 2, 0.001)
                               ..translate(0.0,0.36.sh * (1-value).abs(),)
                             ..scale(value)
                             ,

                             child: Opacity(
                                 opacity: opacity,
                                 child: Hero(
                                   tag:drink.name ,
                                   child: Image.asset(
                                     drink.image,
                                   fit: BoxFit.fitHeight,),
                                 )
                             )
                         ),
                       ),
                     );
                   })),
                 ),
                 Positioned(

                   left: 0,
                   top: 0,
                   right: 0,
                   height: 0.15.sh,

                   child: TweenAnimationBuilder<double>(
                     tween: Tween(begin: 1.0,end: 0.0),
                     builder: (context, value, child) {
                       return Transform.translate(
                         offset: Offset(0.0,-100*value),
                         child: child,
                       );

                     },
                     duration:const Duration(milliseconds: 500),
                     child: Column(
                       children: [
                         Expanded(child: PageView.builder(
                           itemCount: drinks.length,
                           controller: _pageTextController,
                           physics: const NeverScrollableScrollPhysics(),
                           itemBuilder: (context, index) {
                             final opacity=(1-(index-_textPage).abs()).clamp(0.0, 1);
                           return Opacity(
                               opacity: opacity.toDouble(),
                               child: Padding(
                                 padding:  EdgeInsets.symmetric(horizontal: 0.2.sw),
                                 child: Hero(
                                   tag: "text_${drinks[index].name}",
                                   child: Material(
                                     child: Text(
                                         drinks[index].name.toUpperCase()
                                       ,textAlign: TextAlign.center,
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,
                                       style: GoogleFonts.chakraPetch(
backgroundColor: Colors.transparent,
                                       fontWeight: FontWeight.w800,
                                       fontSize: 0.04.sh

                                     ),
                                     ),
                                   ),
                                 ),
                               ),
                           );

                         },),

                         ),


                         AnimatedSwitcher(
                         duration: _duration,
                         child:
                         Text(
                            "${drinks[_currentPage.toInt()].price.toStringAsFixed(2)} TND ",

                           style:Theme.of(context).textTheme.bodyLarge,
                           key: Key(drinks[_currentPage.toInt()].name),

                         )),
                       ],
                     ),
                   )
                 ),
               ],

             ),
           ),
         ],
       ),

      ),
    );
  }
}
