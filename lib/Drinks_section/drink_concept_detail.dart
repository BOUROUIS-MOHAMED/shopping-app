import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shopping_app/Drinks_section/drinks.dart';
import 'package:shopping_app/utils/colors.dart';
import  'package:shopping_app/utils/custom icon/drinkCupIcon.dart';
IconData cup = IconData(0xe800, fontFamily: 'drinkCupIcon', fontPackage: null);
class DrinkConceptDetails extends StatefulWidget {
  const DrinkConceptDetails({Key? key,required this.drink}) : super(key: key);

  final Drink drink;

  @override
  State<DrinkConceptDetails> createState() => _DrinkConceptDetailsState();
}

class _DrinkConceptDetailsState extends State<DrinkConceptDetails> {
  bool cupOneSelected=false;
  bool cupTwoSelected=false;
  bool cupThreeSelected=false;

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
                SizedBox(height: 0.03.sh,
                child: RichText(text: TextSpan(
                  style:  TextStyle(
                    fontSize: 0.018.sh,
                    color: Colors.black38
                  ),
                  children: [
                    TextSpan(text: "Select the Cup Size ",style:GoogleFonts.roboto(
                      color: Colors.black,fontWeight: FontWeight.w800
                        ,fontSize: 0.025.sh
                    ) ),
                    TextSpan(text: "(Small/Medium/Large) :")
                  ]
                ),),
                ),
                
                
                SizedBox(height: 0.2.sh,
                  child: Stack(

                    children: [
              Positioned(
                child: Container(

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center
                    ,mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Align(
                          alignment: Alignment.bottomCenter,
                          child:GestureDetector(
                            onTap: ()=>drinkSmallSizeSelected(),
                            child: Container(
                              height: 0.15.sh,
                              width: 0.2.sw,
                              decoration: BoxDecoration(
                                  color:  cupOneSelected?Colors.black:Colors.black12.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Icon(
                                  cup,
                                  size: 0.05.sh,
                                  color: cupOneSelected?AppColors.yellowColor:Colors.grey),
                            ),
                          )),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 0.1.sw),
                        child:  Align(
                            alignment: Alignment.bottomCenter,
                            child:GestureDetector(
                              onTap: ()=>drinkMediumSizeSelected(),
                              child: Container(
                                height: 0.15.sh,
                                width: 0.2.sw,
                                decoration: BoxDecoration(
                                    color:  cupTwoSelected?Colors.black:Colors.black12.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Icon(
                                    cup,
                                    size: 0.075.sh,
                                    color: cupTwoSelected?AppColors.yellowColor:Colors.grey),
                              ),
                            )),),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child:GestureDetector(
                          onTap: ()=>drinkLargeSizeSelected(),
                          child: Container(
                            height: 0.15.sh,
                            width: 0.2.sw,
                            decoration: BoxDecoration(
                              color:  cupThreeSelected?Colors.black:Colors.black12.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(
                                cup,
                                size: 0.10.sh,
                                color: cupThreeSelected?AppColors.yellowColor:Colors.grey),
                          ),
                        )),


                    ],
                  ),
                ),
              )
,

                    ],
                  ),

                ),
                SizedBox(height: 0.05.sh,),
                SizedBox(
                  height: 50,
                  child: Center(
                    child: GestureDetector(
                      onTap: ()=>NotifyMe(),
                      child: Container(
                        alignment: Alignment.center,
                        width: 0.9.sw,
                        height: 0.1.sh,
                        decoration: BoxDecoration(
                          color: AppColors.appGreen,
                          borderRadius: BorderRadius.circular(10.r)
                        ),
                        child: Text("Notify my choice",style: GoogleFonts.novaMono(
                          fontSize: 0.03.sh,
                          color: Colors.white
                        ),),


                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  drinkSmallSizeSelected() async{
    setState(() {
      cupOneSelected=true;
      cupTwoSelected=false;
      cupThreeSelected=false;
    });
  }
  drinkMediumSizeSelected() async{
    setState(() {
      cupOneSelected=false;
      cupTwoSelected=true;
      cupThreeSelected=false;
    });
  }
  drinkLargeSizeSelected() async{
    setState(() {
      cupOneSelected=false;
      cupTwoSelected=false;
      cupThreeSelected=true;
    });

  }

}

NotifyMe() {
  print("just clicked");
}
