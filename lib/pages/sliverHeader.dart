import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_study/pages/widgets/sliver_custom_header_delegate.dart';

class SliverHeaderDemo extends StatefulWidget {
  SliverHeaderDemo({Key key}) : super(key: key);

  @override
  _SliverHeaderDemoState createState() {
    return _SliverHeaderDemoState();
  }
}

class _SliverHeaderDemoState extends State<SliverHeaderDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  callback() async{
    print("点击返回");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0xFF201E24),
        body:NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverCustomHeaderDelegate(
                    context: context,
                    coverImgUrl: 'assets/images/sliver_bg.png',
                    collapsedHeight: ScreenUtil().setHeight(90),
                    expandedHeight: ScreenUtil().setHeight(280),
                    title: '吸附效果测试',
                    popCallBack:callback,
                    paddingTop: 0),
              )
            ];
          },
          body: Container(
            color: Colors.white,
            child: SafeArea(
              child: Stack(children: [
                SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            color: Colors.white,
                            child: Container(
                              height: ScreenUtil().setWidth(1333),
                              width: ScreenUtil().setWidth(750),
                            )),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    )),

              ]),
            ),
          ),
        ),
    );
  }
}