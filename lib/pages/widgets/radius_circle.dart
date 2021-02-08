import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class RadiusCircle extends StatelessWidget {
  final Color color;
  RadiusCircle({Key key,this.color=Colors.red}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // margin: EdgeInsets.only(
      //     left: ScreenUtil().setHeight(31),
      //     right: ScreenUtil().setHeight(31)),
      width: ScreenUtil().setWidth(12),
      height: ScreenUtil().setWidth(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(1000),
      ),
    );
  }
}
