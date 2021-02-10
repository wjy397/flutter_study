import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class AnimationDemo extends StatefulWidget {
  AnimationDemo({Key key}) : super(key: key);

  @override
  _AnimationDemoState createState() {
    return _AnimationDemoState();
  }
}

class _AnimationDemoState extends State<AnimationDemo>  with SingleTickerProviderStateMixin{

  bool isStartTrain = false;
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {

    _animationController =
        AnimationController(duration: Duration(seconds: 300), vsync: this);

    _animation =  Tween<double>(
      begin: 1,
      end: 300,
    ).animate(_animationController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画完成后反转
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 反转回初始状态时继续播放，实现无限循环
        _animationController.forward();
      }

    });



    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: (){
            if(isStartTrain == false){
              _animationController.forward();
            }else{
              _animationController.stop();
            }
            setState(() {
              isStartTrain = !isStartTrain;
            });
          },
          child: Stack(
            children: [
              Positioned(
                child: Center(
                  child: RotationTransition(
                    //设置动画的旋转中心
                    alignment: Alignment.center,
                    //动画控制器
                    turns: _animation,
                    child: Container(
                      width: ScreenUtil().setWidth(180),
                      height: ScreenUtil().setWidth(180),
                      decoration: BoxDecoration(
                        image:DecorationImage(
                          image: AssetImage("assets/images/bg_timer.png"),
                          fit: BoxFit.cover,
                        ),
                        // color: Color(0xFFFF542C),
                        // borderRadius: BorderRadius.circular(1000)
                      ),

                    ),
                  ),
                ),
              ),
              Positioned(
                child: Center(
                    child: Text(
                      '${isStartTrain?"结束":"开始"}',
                      style: TextStyle(
                          color: Color(0xFF201E24),
                          fontSize: ScreenUtil().setSp(28)),
                    )),
              )
            ],

          ),
        ),
      ),
    );
  }
}