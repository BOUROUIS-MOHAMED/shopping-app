import 'package:flutter/cupertino.dart';
import 'package:shopping_app/Store_interface_section/store_products.dart';
enum StoreState{
  normal,
  details,
  cart
}

class StoreBloc with ChangeNotifier{

  StoreState storeState = StoreState.normal;
  List<StoreProduct> catalog= List.unmodifiable(storeProduct);
  List<StoreProductItem> cart= [];

  void changeToNormal(){
    storeState=StoreState.normal;
  }
  void changeToCart(){
    storeState=StoreState.cart;
  }

void AddProduct( StoreProduct product){
    for(StoreProductItem item in cart){
      if (item.storeProduct.name == product.name){
        item.addIncrementToCart();
        notifyListeners();
        return;
      }
    }
    cart.add(StoreProductItem(storeProduct: product));
    notifyListeners();
}
int totalCartElements(){
   return cart.fold<int>(0, (previousValue, element) =>previousValue+ element.quantity);

  }
  double totalCartAmount(){
    return cart.fold<double>(0, (previousValue, element) =>previousValue+ (element.storeProduct.price*element.quantity));
  }

  void deleteProductFromCart(StoreProductItem product) {
    cart.remove(product);
    notifyListeners();
  }
}


class StoreProductItem {
  StoreProductItem({this.quantity=1, required this.storeProduct});

   int quantity;
  final StoreProduct storeProduct;


  void addIncrementToCart(){
quantity++;
  }
  void removeIncrementFromCart(){

  }
  void clearAllProductFromCart(){

  }

}


