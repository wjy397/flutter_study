import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImgUrl;
  final String title;
  final Function popCallBack;
  BuildContext context;

  SliverCustomHeaderDelegate({
    this.context,
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.coverImgUrl,
    this.title,
    this.popCallBack
  });

  @override
  double get minExtent =>
      this.collapsedHeight +
          this.paddingTop +
          MediaQuery.of(context).padding.top;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  Color makeStickyHeaderTitleColor(shrinkOffset) {
    //它代表当前头部的滚动偏移量
    if (shrinkOffset > 50) {
      return Colors.transparent;
    } else {
      return Color(0xFFFF542C);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // // 背景图
          Container(child: Image.asset(this.coverImgUrl, fit: BoxFit.fill)),
          // 收起头部
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.makeStickyHeaderBgColor(shrinkOffset), // 背景颜色
              child:
              // SafeArea(
              //   bottom: false,
              //   child:
              Container(
                height:
                this.collapsedHeight + MediaQuery.of(context).padding.top,
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () async{
                        await popCallBack();
                      },
                      padding: const EdgeInsets.all(16.0),
                      icon: Image.asset(
                        'assets/images/ic_back.png',
                        color:
                        this.makeStickyHeaderTextColor(shrinkOffset, true),
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(400),
                      child: Text(
                        this.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: this.makeStickyHeaderTextColor(
                              shrinkOffset, false), // 标题颜色
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: 0,
                      duration: Duration(microseconds: 200),
                      child: IconButton(
                        padding: const EdgeInsets.all(16.0),
                        icon: Image.asset(
                          'assets/images/ic_back.png',
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, true),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ),
            ),
          ),
          Positioned(
              bottom: ScreenUtil().setHeight(40),
              left: ScreenUtil().setWidth(30),
              child: Container(
                width: ScreenUtil().setWidth(500),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(34),
                    color: this.makeStickyHeaderTitleColor(
                        shrinkOffset), // Color(0xFFFF542C)),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}