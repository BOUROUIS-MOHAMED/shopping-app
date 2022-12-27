import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaggeredDualView extends StatelessWidget {
   StaggeredDualView({Key? key,
     required this.itemBuilder,
     required this.itemCount,
      this.spacing=0.0,
      this.aspectRatio=0.5}) : super(key: key);
final IndexedWidgetBuilder itemBuilder;
final int itemCount;
final double spacing;
final double aspectRatio;
  @override
  Widget build(BuildContext context) {

    return  LayoutBuilder(
      builder: (context, constraints) {
      final width=constraints.maxWidth;
      final height=constraints.maxHeight+200;
      final itemHeight= aspectRatio*0.15.sh;
     return  GridView.builder(
       padding: EdgeInsets.only(bottom:itemHeight ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: aspectRatio,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,

          ),
        itemCount: itemCount,
        itemBuilder:(context, index) {

            return Transform.translate(

                offset: Offset(0.0, index.isOdd?0.1.sh:0.0),
            child: itemBuilder(
                context,index),);
          }, );}
    );
  }
}
