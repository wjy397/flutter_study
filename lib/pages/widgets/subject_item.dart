import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_study/pages/widgets/radius_circle.dart';

import 'load_image.dart';


class SubjectItem extends StatefulWidget {
  final int id;
  final String name;
  final bool showBottm;
  final Function callBack;

  SubjectItem({Key key, this.id, this.name, this.showBottm=false,this.callBack}) : super(key: key);

  @override
  _SubjectItemState createState() {
    return _SubjectItemState();
  }
}

class _SubjectItemState extends State<SubjectItem> {
  // bool showBottm = false;

  List panelData = [{'level':1,'result':'结果','score':'0'},{'level':2,'result':'结果','score':'1'},{'level':3,'result':'结果','score':'0'},{'level':1,'result':'结果','score':'2'},];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  click() async {
    if (widget.showBottm == true) {
      widget.callBack(false,widget.id);

    }else{
      widget.callBack(true,widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              click();
            },
            child: Container(
                width: double.infinity,
                // height: ScreenUtil().setHeight(100),
                padding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: ScreenUtil().setHeight(30)),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: new Border.all(
                    color: Color(0xFFA0AACD).withOpacity(0.1), //边框颜色
                    width: 1, //边框宽度
                  ), // 边色与边宽度
                  color: Colors.white, // 底色
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3, //阴影范围
                      spreadRadius: 0.1, //阴影浓度
                      color: Color(0xFFA0AACD).withOpacity(0.1), //阴影颜色
                    ),
                  ],
                ),
                child: Column(children: [
                  Row(
                    children: [
                      RadiusCircle(
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      widget.showBottm == true
                          ? LoadAssetImage(
                        'shang',
                        width: ScreenUtil().setWidth(20),
                      )
                          : LoadAssetImage('xia',
                          width: ScreenUtil().setWidth(20))
                    ],
                  ),
                  Visibility(
                    visible: widget.showBottm == true,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            color: Colors.white,
                            width: double.infinity,
                            height: ScreenUtil().setHeight(90),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '用时',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(28)),
                                ),
                                Text(
                                  '分数',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(28)),
                                )
                              ],
                            ),
                          ),
                          panelData.length==0?Container(
                            child: Text('无数据',style: TextStyle(color: Colors.grey),),
                          ):
                          Column(
                            children: panelData.map((e) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                color: e['level'] == 1
                                    ? Color(0xFF54D060).withOpacity(0.2)
                                    : (e['level'] == 2
                                    ? Color(0xFFFFC21E).withOpacity(0.2)
                                    : (e['level'] == 3
                                    ? Color(0xFFFF6638).withOpacity(0.2)
                                    : Color(0xFFFF2B2B)
                                    .withOpacity(0.2))),
                                width: double.infinity,
                                height: ScreenUtil().setHeight(90),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e['result'] ?? '无',
                                      style: TextStyle(
                                          color: e['level'] == 1
                                              ? Color(0xFF54D060)
                                              : (e['level'] == 2
                                              ? Color(0xFFFFC21E)
                                              : (e['level'] == 3
                                              ? Color(0xFFFF6638)
                                              : Color(0xFFFF2B2B))),
                                          fontSize: ScreenUtil().setSp(28)),
                                    ),
                                    Text(
                                      (e['score'] ?? '无').toString(),
                                      style: TextStyle(
                                          color: e['level'] == 1
                                              ? Color(0xFF54D060)
                                              : (e['level'] == 2
                                              ? Color(0xFFFFC21E)
                                              : (e['level'] == 3
                                              ? Color(0xFFFF6638)
                                              : Color(0xFFFF2B2B))),
                                          fontSize: ScreenUtil().setSp(28)),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  )
                ])),
          ),
        ],
      ),
    );
  }
}
