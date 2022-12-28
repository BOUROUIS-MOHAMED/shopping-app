import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shopping_app/Drinks_section/drinks.dart';
import 'package:shopping_app/utils/colors.dart';
import  'package:shopping_app/utils/custom icon/drinkCupIcon.dart';

import 'drink_shopping_cart.dart';

class DrinkConceptDetails extends StatefulWidget {
   DrinkConceptDetails({Key? key,required this.drink}) : super(key: key);


  final Drink drink;

  @override
  State<DrinkConceptDetails> createState() => _DrinkConceptDetailsState();
}

class _DrinkConceptDetailsState extends State<DrinkConceptDetails> with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
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
      body: Column(

        children: [
          SizedBox(height: 0.1.sh,),
          Container(

            height: 0.9.sh,
            width: 1.sw,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  0.2.sw),
                  child: Hero(

                    tag: "text_${widget.drink.name}",
                    child: Material(

                      child: Text(
                        widget.drink.name,

                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.orbitron(fontSize: 20,
                            fontWeight: FontWeight.w700,
                            backgroundColor: Colors.transparent),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 0.08.sh,),
                SizedBox(height: 0.35.sh,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Hero(
                      tag: widget.drink.name,
                      child: Image.asset(widget.drink.image,fit:BoxFit.fitHeight),
                      )


                    ),
                    Positioned(
                      left: 0.1.sw,
                      bottom: -0.01.sh,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 1.0,end: 0.0),
                        builder: (context, value, child) {
return Transform.translate(
  offset: Offset(-100*value,250*value),
  child: child,
);

                        },
                        duration:const Duration(milliseconds: 500),
child: Text(
  "${widget.drink.price.toStringAsFixed(2)} TND ", style:GoogleFonts.harmattan(
  fontWeight: FontWeight.w900,
  fontSize: 0.05.sh,
  color: Colors.white,
  shadows: [
    BoxShadow(
            color: Colors.black87,
            blurRadius: 20,
            spreadRadius:50,

    )
  ]
),
)
                      ,),
                    ),
                    Positioned(
                      right: 0.2.sw,
                      top: 0.01.sh,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 1.0,end: 0.0),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(100*value,-250*value),
                            child: child,
                          );

                        },
                        duration:const Duration(milliseconds: 500),
                        child:Container(
                          width: 0.05.sh,
                          height: 0.05.sh,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: -35,
                                blurRadius: 10,
                                offset: Offset(0, 0), // Shadow position
                              ),
                            ],
                          ),
                          child: Icon(Icons.add),
                        )
                        ,),
                    )
                  ],
                ),

                ),
                SizedBox(height: 0.05.sh,),




Spacer(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 0.07.sw,vertical: 0.03.sh),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 0.05.sh,
                        width: 0.05.sh,

                        decoration: BoxDecoration(
                          color: Colors.white,
 boxShadow: [
   BoxShadow(
     color: Colors.black,
     spreadRadius: -5,
     blurRadius: 15
   )
 ],
                          borderRadius: BorderRadius.circular(30.r)

                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: (){

                            }
                            ,
                            color: Colors.white,
                            icon: Icon(FontAwesomeIcons.solidHeart,color: Colors.black,size: 0.02.sh,),

                          ),
                        ),
                      ),
                      Container(
                        height: 0.05.sh,
                        width: 0.05.sh,

                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -5,
                                  blurRadius: 15
                              )
                            ],
                            borderRadius: BorderRadius.circular(30.r)

                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: (){
                              openShoppingCart(widget.drink);
                            }
                            ,
                            color: Colors.white,
                            icon: Icon(CupertinoIcons.cart_badge_plus,color: Colors.black,),

                          ),
                        ),
                      ),

/*FloatingActionButton(onPressed: (){},
backgroundColor: Colors.black,
child: Center(child: Icon(CupertinoIcons.cart,color: Colors.white,)),)*/
                    ],
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }



  void openShoppingCart(Drink drink) async{
await Navigator.of(context).push(PageRouteBuilder(
  opaque: false,
    pageBuilder: (context, animation, secondaryAnimation) {
      return FadeTransition(opacity: animation,
      child: DrinkShoppingCart(drink: drink,),);
    },));
  }

}

NotifyMe() {
  print("just clicked");
}
/*    SizedBox(
                  height: 0.1.sh,
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {


                        return GestureDetector(
                          onTap: (){
                          setState(() {
    NotifyMe();
    _controller.forward();
                          });
    },
                        child: Container(
                        alignment: Alignment.center,
                        width: (_addToCartButtonWidth*_animationButton1.value).clamp(_addToCartCircularButtonWidth, _addToCartButtonWidth),
                        height: _addToCartButtonHeight,
                        decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(1.r*(_animationButton1.value+40))
                        ),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                           if(_animationButton1.value == 1)
                            ...[
                             SizedBox(width: (0.07.sw*_animationButton1.value).clamp(0.0, 0.07.sw)),
                             Text(  "ADD TO CART",style: GoogleFonts.aBeeZee(
                                 fontSize: 0.03.sh,
                                 color: Colors.white
                             ),),
                           ]
                          ],
                        ),


                        ),
                        );
                        }

                    ),
                  ),
                )*/