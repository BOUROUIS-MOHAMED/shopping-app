import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/Drinks_section/drinks.dart';

import '../utils/colors.dart';
IconData cup = IconData(0xe800, fontFamily: 'drinkCupIcon', fontPackage: null);
class DrinkShoppingCart extends StatefulWidget {
   DrinkShoppingCart({Key? key,required this.drink}) : super(key: key);
final Drink drink;

  @override
  State<DrinkShoppingCart> createState() => _DrinkShoppingCartState();
}

class _DrinkShoppingCartState extends State<DrinkShoppingCart> with TickerProviderStateMixin{
  double _cartButtonInitialSize=0.06.sh;
  double _panelBigCircularSize=0.35.sw;
  double firstResizePanelSize=0.2.sh;
  double secondResizePanelSize=0.1.sh;


  double resizeAnimationBeginIntervalForFirstOne=0.0;
  double resizeAnimationEndIntervalForFirstOne=0.3;

  double resizeAnimationBeginIntervalForSecondOne=0.35;
  double resizeAnimationEndIntervalForSecondOne=0.45;

  double dropAnimationBeginInterval=0.5;
  double dropAnimationEndInterval=0.65;

  double shakeAnimationBeginInterval=0.7;
  double shakeAnimationEndInterval=0.8;

  double hideAnimationBeginInterval=0.85;
  double hideAnimationEndInterval=1.0;
/******************************************************/
  late AnimationController _controller;
  late Animation _animationResizeCartButtonFirstOne;
  late Animation _animationResizePanelFirstOne;
  late Animation _animationResizePanelSidesFirstOne;
  late Animation _animationResizePanelSidesSecondOne;
  late Animation _animationResizeImageFirstOne;
  late Animation _animationResizePanelSecondOne;
  late Animation _animationResizeImageSecondOne;
  late Animation _animationShake;
  late Animation _animationDropDownPanel;
  late Animation _animationHide;
  late Animation _mainAxesStatus;
/******************************************************/
  @override

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;
    final isAnimationStarted =_animationResizeCartButtonFirstOne.value==_cartButtonInitialSize;
    List mainAxis=[
      MainAxisAlignment.start,
      MainAxisAlignment.center
    ];


    return  Material(

      color: Colors.transparent,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  color: Colors.black87,

                ),
              )),
              AnimatedBuilder(

                  animation: _controller,
                  builder: (context, child) {
                    return Positioned(



                        left:_animationResizePanelSidesFirstOne.value / _animationResizePanelSidesSecondOne.value ,
                        right:_animationResizePanelSidesFirstOne.value / _animationResizePanelSidesSecondOne.value ,



                       top:(1.sh-1.sw* _animationDropDownPanel.value/1.sh)-_animationShake.value+_animationHide.value,


                      child: Stack(
                        children: [

                          TweenAnimationBuilder(

                            tween: Tween(begin: 1.0, end: 0.0),
                            curve: Curves.easeIn,
                            duration: Duration(milliseconds: 400),
                            builder: (context, value, child) {
                              return Transform.translate(

                                offset: Offset(0.0, value * MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.6),
                                child: child,
                              );
                            },
                            child: Container(
                              width: (size.width),
                              height: (_animationResizePanelFirstOne.value*_animationResizePanelSecondOne.value),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: _animationResizeCartButtonFirstOne.value==_cartButtonInitialSize?Radius.circular(35) :Radius.circular(65),
                                      topRight: _animationResizeCartButtonFirstOne.value==_cartButtonInitialSize?Radius.circular(35) :Radius.circular(65),
                                      bottomRight:_animationResizeCartButtonFirstOne.value==_cartButtonInitialSize?Radius.circular(0) :Radius.circular(65),
                                      bottomLeft: _animationResizeCartButtonFirstOne.value==_cartButtonInitialSize?Radius.circular(0) :Radius.circular(65),

                                  )
                              ),
                              child: Column(
                                mainAxisAlignment:mainAxis[ _mainAxesStatus.value.round()],
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: (isAnimationStarted?0.05.sw:0.0),
                                        right: (isAnimationStarted?0.05.sw:0.0),
                                        top:(_animationResizeImageFirstOne.value-0.05.sh),
                                      bottom: (_animationResizeImageFirstOne.value-0.05.sh)

                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Center(
                                          child: Image.asset(widget.drink.image,
                                            fit: BoxFit.contain,
                                            width: (_animationResizeImageFirstOne.value*_animationResizeImageSecondOne.value)*cupInitialSize),
                                        ),



                                        if (_animationResizeCartButtonFirstOne.value==_cartButtonInitialSize)
                                          ...[
                                            Spacer(),
                                            Column(
                                              children: [
                                                Text(widget.drink.name
                                                    .toUpperCase(),
                                                    style: GoogleFonts.armata(
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      fontSize: 0.018.sh,)),
                                                SizedBox(height: 0.01.sh,),
                                                Text(widget.drink.price
                                                    .toStringAsFixed(2) +
                                                    " TND",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 0.025.sh
                                                  ),
                                                ),
                                              ],
                                            )
                                          ]
                                      ],
                                    ),


                                  ),

                                ],
                              ),
                            ),
                          ),

                        ],
                      ));
                }
              ),

              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0.sh,
                  child: Column(

                children: [
                  if (_animationResizeCartButtonFirstOne.value==_cartButtonInitialSize)
                    ...[
                      SizedBox(height: 0.03.sh,
                        child: RichText(text: TextSpan(
                            style:  TextStyle(
                                fontSize: 0.018.sh,
                                color: Colors.black38
                            ),
                            children: [
                              TextSpan(text: "SIZE",style:GoogleFonts.athiti(
                                  color: Colors.grey,fontWeight: FontWeight.w800
                                  ,fontSize: 0.025.sh
                              ) ),

                            ]
                        ),),
                      ),
                      SizedBox(height: 0.02.sh,),
                      SizedBox(height: 0.2.sh,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(

                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start
                                  ,mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: ()=>drinkSmallSizeSelected(),
                                      child: Container(
                                          height: 0.05.sh,
                                          width: 0.2.sw,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black
                                              ),
                                              color:  cupOneSelected?Colors.black:Colors.white,

                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: cupOneSelected?5:2,
                                                  blurRadius:cupOneSelected?10:5
                                              )]
                                          ),
                                          child: Center(child: Text("SMALL",textAlign: TextAlign.center,style: GoogleFonts.atma(
                                            fontSize: 0.015.sh,fontWeight: FontWeight.w500,color: cupOneSelected?Colors.white:Colors.black,
                                          ),))
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 0.1.sw),
                                      child:  GestureDetector(
                                        onTap: ()=>drinkMediumSizeSelected(),
                                        child:Container(
                                            height: 0.05.sh,
                                            width: 0.2.sw,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black
                                                ),
                                                color:  cupTwoSelected?Colors.black:Colors.white,

                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [BoxShadow(
                                                    color: Colors.grey,
                                                    spreadRadius: cupTwoSelected?5:2,
                                                    blurRadius:cupTwoSelected?10:5
                                                )]
                                            ),
                                            child: Center(child: Text("MEDIUM",textAlign: TextAlign.center,style: GoogleFonts.atma(
                                              fontSize: 0.018.sh,fontWeight: FontWeight.w700,color: cupTwoSelected?Colors.white:Colors.black,
                                            ),))
                                        ),
                                      ),),
                                    GestureDetector(
                                      onTap: ()=>drinkLargeSizeSelected(),
                                      child: Container(
                                          height: 0.05.sh,
                                          width: 0.2.sw,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black
                                              ),
                                              color:  cupThreeSelected?Colors.black:Colors.white,

                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: cupThreeSelected?5:2,
                                                  blurRadius:cupThreeSelected?10:5
                                              )]
                                          ),
                                          child: Center(child: Text("LARGE",textAlign: TextAlign.center,style: GoogleFonts.atma(
                                            fontSize: 0.022.sh,fontWeight: FontWeight.w900,color: cupThreeSelected?Colors.white:Colors.black,
                                          ),))
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            )
                            ,

                          ],
                        ),

                      ),

                    ]
                ],
              )),

              Positioned(
                bottom: 0.01.sh+_animationShake.value-_animationHide.value,
                left: 0,
                right: 0,
                child: Container(
                  child: SizedBox(
                    height: 0.12.sh,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.forward();
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 1.3.sw-( _animationResizeCartButtonFirstOne.value*4),
                          height: _animationResizeCartButtonFirstOne.value,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(
                                  1.r * (60))
                          ),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Icon(CupertinoIcons.bag,
                                size: 0.04.sh,

                                color: Colors.white,),
                              if(_animationResizeCartButtonFirstOne.value==_cartButtonInitialSize)
                                ...[
                                  SizedBox(width: (0.07.sw)),
                                  Text("ADD TO CART",
                                    style: GoogleFonts.armata(
                                        fontSize: 0.02.sh,
                                        color: Colors.white
                                    ),),
                                ]
                            ],
                          ),


                        ),
                      )
                    ),
                  ),
                ),
              )

            ],

          );
        })
    );
  }



  void initState() {
    _controller=AnimationController(vsync:this,duration: const  Duration(milliseconds: 2000));
    _animationResizeCartButtonFirstOne=
        Tween(
            begin: _cartButtonInitialSize,
            end:0.13.sh).animate(CurvedAnimation(

            parent: _controller,
            curve: Interval(
                resizeAnimationBeginIntervalForFirstOne,
                resizeAnimationEndIntervalForFirstOne
            )));
    ////////////////
    _animationResizeImageFirstOne=
        Tween(
            begin: 0.08.sh,
            end:0.05.sh).animate(CurvedAnimation(

            parent: _controller,
            curve: Interval(
                resizeAnimationBeginIntervalForFirstOne,
                resizeAnimationEndIntervalForFirstOne
            )));
    _animationResizeImageSecondOne=
        Tween(
            begin: 1.0,
            end:0.7).animate(CurvedAnimation(

            parent: _controller,
            curve: Interval(
                resizeAnimationBeginIntervalForSecondOne,
                resizeAnimationEndIntervalForSecondOne
            )));
    ////////////////
    _animationResizePanelFirstOne=
        Tween(
            begin: 1.sw,
            end:_panelBigCircularSize).animate(CurvedAnimation(

            parent: _controller,
            curve: Interval(
                resizeAnimationBeginIntervalForFirstOne,
                resizeAnimationEndIntervalForFirstOne
            )));
    _animationResizePanelSecondOne=
        Tween(
            begin: 1.0,
            end:0.55).animate(CurvedAnimation(

            parent: _controller,
            curve: Interval(
                resizeAnimationBeginIntervalForSecondOne,
                resizeAnimationEndIntervalForSecondOne
            )));
    ////////////////
    _animationResizePanelSidesFirstOne=
        Tween(
            begin: 0.0,
            end:((1.sw/2)-(_panelBigCircularSize/2))).animate(CurvedAnimation(

            parent: _controller,
            curve: Interval(
                resizeAnimationBeginIntervalForFirstOne,
                resizeAnimationEndIntervalForFirstOne
            )));
    _animationResizePanelSidesSecondOne=
        Tween(
            begin: 1.0,
            end:0.8).animate(CurvedAnimation(

            parent: _controller,
            curve: Interval(
                resizeAnimationBeginIntervalForSecondOne,
                resizeAnimationEndIntervalForSecondOne
            )));
    ////////////////
    _animationShake=
        Tween(
            begin: 0.0.sh,
            end:0.1.sh).animate(CurvedAnimation(

            parent: _controller,
            curve: Interval(
              curve: Curves.bounceInOut,
                shakeAnimationBeginInterval,
                shakeAnimationEndInterval
            )));

    ////////////////
    _animationDropDownPanel=
        Tween(
            begin: 1.sh,
            end:0.25.sh).animate(CurvedAnimation(

            parent: _controller,
            curve: Interval(
              curve: Curves.fastOutSlowIn,
                dropAnimationBeginInterval,
                dropAnimationEndInterval
            )));
    ////////////////
    _animationHide=
        Tween(
            begin: 0.0.sh,
            end:0.8.sh).animate(CurvedAnimation(

            parent: _controller,
            curve: Interval(
                hideAnimationBeginInterval,
                hideAnimationEndInterval
            )));
    ////////////////

    _mainAxesStatus=   Tween(
        begin: 0.49,
        end:1.0).animate(CurvedAnimation(

        parent: _controller,
        curve: Interval(
            resizeAnimationBeginIntervalForFirstOne,
            resizeAnimationBeginIntervalForSecondOne,
        )));
    ////////////////
    _controller.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        Navigator.of(context).pop();
      }

    });

    super.initState();
  }








  double cupInitialSize=1;
  bool cupOneSelected=false;
  bool cupTwoSelected=false;
  bool cupThreeSelected=false;


  drinkSmallSizeSelected() async{
    setState(() {
      cupOneSelected=true;
      cupTwoSelected=false;
      cupThreeSelected=false;
      cupInitialSize=0.9;

    });
  }
  drinkMediumSizeSelected() async{
    setState(() {
      cupOneSelected=false;
      cupTwoSelected=true;
      cupThreeSelected=false;
      cupInitialSize=1;
    });
  }
  drinkLargeSizeSelected() async{
    setState(() {
      cupOneSelected=false;
      cupTwoSelected=false;
      cupThreeSelected=true;
      cupInitialSize=1.1;
    });

  }


}
