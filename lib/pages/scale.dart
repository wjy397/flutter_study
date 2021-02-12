import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study/pages/widgets/scaleplate_widget.dart';

class ScaleDemo extends StatefulWidget {
  ScaleDemo({Key key}) : super(key: key);

  @override
  _ScaleDemoState createState() {
    return _ScaleDemoState();
  }
}

class _ScaleDemoState extends State<ScaleDemo> {

  double scaleplate_height = 550;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [ Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
              child: ScaleplateWidget(
                width: ScreenUtil().setWidth(750),
                height: scaleplate_height,
              ),
            )],
          ),
        ),
      ),
    );
  }
}