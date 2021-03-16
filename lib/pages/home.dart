import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study/routes/demo/root_router.dart';
import 'package:flutter_study/routes/fluro_navigator.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  menuItem(name){
    return Container(
      width: ScreenUtil().setWidth(200),
      height: ScreenUtil().setWidth(80),
      color: Colors.blue,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //设置设计稿分辨率
    ScreenUtil.init(context, width: 750, height: 1334);
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  NavigatorUtils.push(context, RootRouter.drawer);
                },
                child: menuItem('手风琴效果'),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  NavigatorUtils.push(context, RootRouter.animation);
                },
                child: menuItem('旋转动画'),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  NavigatorUtils.push(context, RootRouter.scale);
                },
                child: menuItem('刻度尺'),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  NavigatorUtils.push(context, RootRouter.sliverHeader);
                },
                child: menuItem('顶部吸附'),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  NavigatorUtils.push(context, RootRouter.customHeader);
                },
                child: menuItem('上滑出现tab栏'),
              )
            ],
          ),
        ));
  }
}
