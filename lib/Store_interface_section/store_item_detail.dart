import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/Store_interface_section/store_products.dart';
import 'package:shopping_app/utils/colors.dart';

class StoreItemDetail extends StatefulWidget {
   StoreItemDetail({Key? key, required this.product,required this.onProductAdded}) : super(key: key);
final StoreProduct product;
final VoidCallback onProductAdded;

  @override
  State<StoreItemDetail> createState() => _StoreItemDetailState();
}

class _StoreItemDetailState extends State<StoreItemDetail> {

  String heroTag='';

void _addToCart(BuildContext context){
 setState(() {
   heroTag='details';
 });
widget.onProductAdded();

Navigator.of(context).pop();
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,

appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 0,
  leading: BackButton(color: Colors.black,),

),
      body:Column(

        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                    tag:"list${widget.product.name}$heroTag",

                    child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.cover,
                        height: 0.3.sh)),
                Text(widget.product.name,style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 0.01.sh,),
                Text(widget.product.weight,style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                ),),
                Row(
                  children: [
                    Spacer(),
                    Text(widget.product.price.toStringAsFixed(2)+" TND",style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: AppColors.darkGreen,
                        fontWeight: FontWeight.bold,
                      decoration: TextDecoration.overline

                    ),)
                  ],
                ),
                SizedBox(height: 0.06.sh,),
                Text("About the product",style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 0.02.sh,),
                Padding(
                  padding:  EdgeInsets.only(left: 0.08.sw),
                  child: Text(widget.product.description,style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w200
                  ),),
                ),
              ],
            ),
          )),
          Padding(
            padding:  EdgeInsets.all(0.01.sh),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,color: AppColors.appGreen,))),
                Expanded(
                    flex: 5,
                    child: ElevatedButton(
                  onPressed: (){
                    _addToCart(context);

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


                ))
              ],
            ),
          )
        ],
      )
    );
  }
}

/*Hero(
            tag:"list${product.name}",

            child: Image.asset(product.image,fit: BoxFit.cover,height: 0.15.sh))
*/
