import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shopping_app/Store_interface_section/store_bloc.dart';
import 'package:shopping_app/Store_interface_section/store_item_list.dart';
import 'package:shopping_app/Store_interface_section/store_provider.dart';

import '../utils/colors.dart';
final _bottomCardHeigh=0.15.sh;
const duration = Duration(milliseconds: 600);
class StoreHomePage extends StatefulWidget {
  const StoreHomePage({Key? key}) : super(key: key);

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  final bloc=StoreBloc();
 double whitePanelHeight=_bottomCardHeigh;
 double blackPanelHeight=1.sh-_bottomCardHeigh-kToolbarHeight;
 bool appBarVisibility=true;
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      bloc:bloc,

      child: AnimatedBuilder(


animation: bloc,
        builder: (context, child) {



          return SafeArea(

            child: Scaffold(
backgroundColor: Colors.black,
              body: Column(

                children: [

                Container(

                  child: Visibility(
                      visible: appBarVisibility,
                      child: StoreAppBar()),
                ),
                  Expanded(
                child:
                      Stack(
                      children: [
                        AnimatedPositioned(
                            duration: duration,
                            curve: Curves.decelerate,
                            left:0,
                            right: 0,
                            top: -whitePanelHeight-kToolbarHeight+5,
                            height: 1.sh,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.r),bottomRight: Radius.circular(30.r)),
                              child: Container(

                                decoration: BoxDecoration(
                                    color: Colors.white,

                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(top: 0.2.sh),
                                    child: StoreItemList()),
                              ),
                            )),
                        AnimatedPositioned(
                            duration: duration,
                            curve: Curves.decelerate,
                            left:0,
                            right: 0,
                            top: blackPanelHeight,
                            height: 1.sh-kToolbarHeight,

                            child: GestureDetector(
                              onVerticalDragUpdate: _onVerticalGesture,
                              child: Container(
                                color: Colors.black,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.all(_bottomCardHeigh/4),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Cart:",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 0.03.sh,
                                                color: Colors.white

                                            ),),
                                        SizedBox(width: 0.05.sw,),
                                        Expanded(
                                          child: SingleChildScrollView(

                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: List.generate(bloc.cart.length, (index) => Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: 0.01.sw),
                                                child: Stack(
                                                  children: [
                                                    Hero(

                                                      tag: "list${bloc.cart[index].storeProduct.name}details",
                                                      child: CircleAvatar(
                                                        backgroundImage: AssetImage(bloc.cart[index].storeProduct.image),
                                                        backgroundColor: AppColors.darkGreen,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 0,
                                                      child: CircleAvatar(

                                                        backgroundColor: Colors.redAccent,
                                                        radius: 6.r,
                                                        child: Text(bloc.cart[index].quantity.toStringAsFixed(0),style: TextStyle(
                                                          fontSize: 0.012.sh
                                                        ),),

                                                      ),
                                                    ),
                                                  ],
                                                )
                                              )),

                                            ),
                                          ),
                                        ),
                                          CircleAvatar(
                                            backgroundColor: Colors.red,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Placeholder(),
                                  ],
                                ),
                              ),
                            )),

                      ],
              ),

                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
  void _onVerticalGesture (DragUpdateDetails details){
    print(details.primaryDelta);
    if(details.primaryDelta!<-7){
      appBarVisibility=false;
      bloc.changeToCart();
      _getTopForWhitePanel(bloc.storeState);
      _getTopForBlackPanel(bloc.storeState);

    }else if (details.primaryDelta!>12){
      bloc.changeToNormal();
      _getTopForWhitePanel(bloc.storeState);
      _getTopForBlackPanel(bloc.storeState);
      appBarVisibility=true;

    }
  }

   _getTopForWhitePanel(StoreState state){
    if(state ==StoreState.normal){
      setState(() {
        whitePanelHeight=_bottomCardHeigh;
      });

    }
    else if(state==StoreState.cart){
      setState(() {
        whitePanelHeight=1.sh-kToolbarHeight-_bottomCardHeigh/2;
      });
    }
  }
  _getTopForBlackPanel(StoreState state){
    if(state ==StoreState.normal){
      setState(() {
        blackPanelHeight=1.sh-_bottomCardHeigh-kToolbarHeight;
      });
    }
    else if(state==StoreState.cart){
      setState(() {
        blackPanelHeight=0.06.sh;
      });
    }
  }

}



class StoreAppBar extends StatelessWidget {
  const StoreAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: kToolbarHeight,
      alignment: Alignment.bottomCenter,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
              onPressed: (){

              }, icon: Icon(Icons.chevron_left)),
          SizedBox( width: 0.1.sw),
          Expanded(child: Text(
            "Store",style: TextStyle(
              color: Colors.black,
            fontSize: 0.03.sh
          ),
          )),
          IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.sliders,size: 0.05.sw,))
        ],
      ),
    );
  }
}

