import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/Store_interface_section/store_provider.dart';

import '../utils/colors.dart';

class StoreCartList extends StatefulWidget {
  const StoreCartList({Key? key}) : super(key: key);

  @override
  State<StoreCartList> createState() => _StoreCartListState();
}

class _StoreCartListState extends State<StoreCartList> {



  @override
  Widget build(BuildContext context) {
    final bloc=StoreProvider.of(context)?.bloc;
    void removeItemFromCart(int index){
      bloc?.deleteProductFromCart(  bloc!.cart[index]);

    }
    void editItemQuantityInCart(){

    }
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0.05.sw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Expanded(
          child: Column(
            //padding:EdgeInsets.all(0.1.sh/6),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Text(
              "Cart:",
              style: GoogleFonts.abel(
                  fontWeight: FontWeight.w200,
                  fontSize: 0.03.sh,
                  color: Colors.white

              ),),
              Expanded(child: ListView.builder(
                itemCount: bloc?.cart.length,
                  itemBuilder: (context, index) {
                  final item=  bloc!.cart[index];
                return SlidableAutoCloseBehavior(
                  closeWhenTapped: true,
                  closeWhenOpened: true,
                  child: Slidable(

                    endActionPane: ActionPane(
                        motion: DrawerMotion(

                        ),
                        children: [
                          SlidableAction(
                              onPressed: (context) {
                                removeItemFromCart(index);
                              },
                            spacing: 5.0,
                            borderRadius: BorderRadius.circular(15),
                            autoClose: true,
                            backgroundColor: Colors.redAccent,
                            icon: CupertinoIcons.delete_simple,
                            label: "Remove",
                          )
                        ]

                    ),
                    child: ListTile(
leading:

 CircleAvatar(
  backgroundColor: Colors.white,
  radius: 15.r,
  child: Image.asset(
      bloc!.cart[index].storeProduct.image,
      fit: BoxFit.fill)
  ,),



/* CircleAvatar(

  backgroundColor: Colors.white,
  radius: 20.r,
  child: Image.asset(
    bloc!.cart[index].storeProduct.image,
    fit: BoxFit.fill)
  ,),*/

                      title: Container(
                        width: 0.4.sw,
                        child: Row(
                          children: [
                            Container(
                              width:0.1.sw,
                              child: Text(
                                "  ${item.quantity}x",style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                " ${bloc!.cart[index].storeProduct.name}",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),

                      trailing: Container(
                        width: 0.22.sw,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                          Container(
                            width:0.16.sw,

                            child: Text("${(item.storeProduct.price*item.quantity).toStringAsFixed(1)} TND", overflow: TextOverflow.ellipsis,style: GoogleFonts.adamina(

                       color: Colors.grey,),),
                          ),
                          Icon(FontAwesomeIcons.chevronRight,color: Colors.grey,size: 0.01.sh,)
                        ],),
                      ),

                    ),
                  ),
                );
              },))

          ],),
        ),
          Row(
            children: [Text('Total',style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),),
            Spacer(),
              Text(
                "${bloc?.totalCartAmount().toString() }",
                style: GoogleFonts.abel(
                    fontWeight: FontWeight.w200,
                    fontSize: 0.025.sh,
                    color: Colors.white

                ),),
            ],
          ),
          SizedBox(height: 0.05.sh,),
          ElevatedButton(
            onPressed: (){


            },
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 0.015.sh),
              child: Text("Add to cart",style: TextStyle(color: Colors.black),),
            ),
            style: ButtonStyle(
              shape:MaterialStateProperty.resolveWith((states) =>  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              )),
              backgroundColor: MaterialStateColor.resolveWith((states) => AppColors.yellowColor),

            ),


          ),

        ],
      ),
    );
  }
}
