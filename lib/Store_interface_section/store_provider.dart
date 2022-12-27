import 'package:flutter/cupertino.dart';
import 'package:shopping_app/Store_interface_section/store_bloc.dart';

class StoreProvider extends InheritedWidget{

  final StoreBloc bloc;
  final Widget child;

  StoreProvider({required this.child,required this.bloc}) : super(child: child);


  static StoreProvider? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<StoreProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>true;
}