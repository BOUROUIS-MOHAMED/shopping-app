import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/Store_interface_section/store_item_detail.dart';
import 'package:shopping_app/Store_interface_section/store_provider.dart';
import 'package:shopping_app/utils/colors.dart';

import '../widgets/staggered_dual_view.dart';


class StoreItemList extends StatelessWidget {
  const StoreItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = StoreProvider.of(context)?.bloc;

    return Container(

      color: AppColors.backGroundColor,
      child: StaggeredDualView(

        aspectRatio: 0.7,
        itemBuilder: (context, index) {
          final product=bloc.catalog[index];
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
reverseTransitionDuration: Duration(milliseconds: 700),
                pageBuilder: (context, animation, secondaryAnimation) {
                return FadeTransition(

                    opacity: animation,
                    child: StoreItemDetail(product:product,
                    onProductAdded:(){
                      bloc.AddProduct(product);
                    }
                    
                    ));
              },));
            },
            child: Card(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)
              ),
elevation: 10,
              child: Padding(
                padding:  EdgeInsets.all(0.01.sh),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min ,
                  children: [
                    Hero(
                      tag:"list${product.name}" ,
                      child: Image.asset(product.image,fit: BoxFit.contain,height: 0.15.sh
                        ,),
                    ),
                    Text("${product.price.toStringAsFixed(2)} TND",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGreen,
                      fontSize: 0.023.sh,
                      decoration: TextDecoration.overline
                    ),
                    overflow: TextOverflow.ellipsis,

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [


                        Text("${product.name}",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 0.018.sh,
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${product.weight}",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 0.01.sh,
                          overflow: TextOverflow.ellipsis,
                        ),),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
itemCount: bloc!.catalog.length,
      ),
    );


    /*ListView.builder(
      padding: EdgeInsets.only(top: 0.1.sh),
      itemCount: bloc?.catalog.length,
      itemBuilder: (context, index) {

      return Container(
        height: 0.2.sh,
        width: 1.sw,
        color: Colors.primaries[index % Colors.primaries.length],

      );
    },);*/
  }
}
