import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_study/pages/widgets/RoundUnderlineTabIndicator.dart';


class OwnnessPage extends StatefulWidget {
  OwnnessPage({Key key}) : super(key: key);

  @override
  _OwnnessPageState createState() {
    return _OwnnessPageState();
  }
}

class _OwnnessPageState extends State<OwnnessPage>
    with SingleTickerProviderStateMixin {
  ScrollController _controller = new ScrollController();
  var globalKeyOne = GlobalKey();
  var globalKeyTwo = GlobalKey();
  var globalKeyThree = GlobalKey();
  var globalKeyFour = GlobalKey();

  var oneY = 0.0;
  var twoY = 0.0;
  var threeY = 0.0;
  var header = 0.0;
  var fourY = 0.0;

  var headerMax = 720;
  var headerMin = 100;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
    if (mounted) {
      /// 延时一下,需要等state layout结束之后才能获取size
      Future.delayed(Duration(milliseconds: 100), () {
        oneY = getY(globalKeyOne.currentContext);
        twoY = getY(globalKeyTwo.currentContext);
        threeY = getY(globalKeyThree.currentContext);
        fourY = getY(globalKeyFour.currentContext);

        header = ScreenUtil().setHeight(this.headerMax - this.headerMin) +
            10; //10是误差
      });
      _controller.addListener(() {
        var of = _controller.offset;
        //第二块距离顶部距离
        var distance_2 = header + (twoY - oneY);
        //第3块距离顶部距离
        var distance_3 = header + (threeY - oneY);
        //第4块距离顶部距离
        var distance_4 = header + (fourY - oneY);
        if (of > header && of < distance_2) {
          _tabController.animateTo(1);
        } else if (of > distance_2 && of < distance_3) {
          _tabController.animateTo(2);
        } else if (of > distance_3 && of < distance_4) {
          _tabController.animateTo(3);
        } else if (of > distance_4) {
          _tabController.animateTo(4);
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget card(value, name, unit) {
    return Container(
      width: ScreenUtil().setWidth(180),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(children: [
            TextSpan(
              text: "${value}  ",
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(32)),
            ),
            TextSpan(
              text: unit,
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(24)),
            ),
          ])),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Text(
            name,
            style: TextStyle(
                color: Color(0xFF7B7994), fontSize: ScreenUtil().setSp(26)),
          ),
        ],
      ),
    );
  }

  TabController _tabController;

  Widget get _tab => Container(
    width: double.infinity,
    height: ScreenUtil().setHeight(100),
    margin: EdgeInsets.only(bottom: 3),
    // 隐藏点击效果
    padding: EdgeInsets.only(
        top: ScreenUtil().setWidth(30),
        left: ScreenUtil().setWidth(15),
        bottom: 2),
    decoration: new BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 0.5, //阴影范围
          offset: Offset(0.0, 3.0),
          spreadRadius: 0.1, //阴影浓度
          color: Color(0xFF100F17).withOpacity(0.05), //阴影颜色
        ),
      ],
    ),
    child: TabBar(
      onTap: (index) {
        if (!mounted) {
          return;
        }
        switch (index) {
          case 0:
            _controller.jumpTo(0);
            _tabController.animateTo(0);
            break;
          case 1:
            _controller.jumpTo(header);
            _tabController.animateTo(1);
            break;
          case 2:
            _controller.jumpTo(header + (twoY - oneY));
            _tabController.animateTo(2);
            break;
          case 3:
            _controller.jumpTo(header + (threeY - oneY));
            _tabController.animateTo(3);
            break;
          case 4:
            _controller.jumpTo(header + (fourY - oneY));
            _tabController.animateTo(4);
            break;
        }
      },
      isScrollable: true,
      //是否可滚动
      controller: _tabController,
      //自定义的indicator，那么indicatorColor、indicatorWeight、indicatorPadding都将被忽略
      indicator: RoundUnderlineTabIndicator(
          borderSide: BorderSide(
            width: 3.5,
            color: Color(0xFFFF542C),
          )),
      labelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(28), fontWeight: FontWeight.w400),
      labelPadding: const EdgeInsets.only(left: 0.0),
      unselectedLabelColor: Colors.grey,
      //未选中label颜色
      labelColor: Color(0xFF201E24),
      //选中label颜色
      tabs: [
        _TabView('基本概况1', 0),
        _TabView('基本概况2', 1),
        _TabView('基本概况3', 2),
        _TabView('基本概况4', 3),
        _TabView('基本概况5', 4)
      ],
    ),
  );

  double getY(BuildContext buildContext) {
    final RenderBox box = buildContext.findRenderObject();
    //final size = box.size;
    final topLeftPosition = box.localToGlobal(Offset.zero);
    return topLeftPosition.dy;
  }

  @override
  Widget build(BuildContext context) {
    Widget _top = SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: ScreenUtil().setHeight(720),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFF6F8FC),
          ),
          Container(
            height: ScreenUtil().setHeight(720),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(30),
                vertical: ScreenUtil().setWidth(60)),
            decoration: new BoxDecoration(
              color: Color(0xFF201E24),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "你好,张三国",
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(34)),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(30),
                            horizontal: ScreenUtil().setHeight(30)),
                        decoration: BoxDecoration(
                          // 边色与边宽度
                            color: Color(0xFF201E24), // 底色
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3, //阴影范围
                                spreadRadius: 0.5, //阴影浓度
                                color:
                                Color(0xFFA0AACD).withOpacity(0.1), //阴影颜色
                              ),
                            ],
                            border: Border(
                                left: BorderSide(
                                    color: Color(0xFFFF542B), width: 3.0))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '学习时长',
                              style: TextStyle(
                                  color: Color(0xFFA7A6B8),
                                  fontSize: ScreenUtil().setSp(26)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "123.5  ",
                                style: TextStyle(
                                    color: Color(0xFFFF542B),
                                    fontSize: ScreenUtil().setSp(42)),
                              ),
                              TextSpan(
                                text: "h",
                                style: TextStyle(
                                    color: Color(0xFFFF542B),
                                    fontSize: ScreenUtil().setSp(24)),
                              ),
                            ])),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(30),
                            horizontal: ScreenUtil().setHeight(30)),
                        decoration: BoxDecoration(
                          // 边色与边宽度
                            color: Color(0xFF201E24), // 底色
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3, //阴影范围
                                spreadRadius: 0.5, //阴影浓度
                                color:
                                Color(0xFFA0AACD).withOpacity(0.1), //阴影颜色
                              ),
                            ],
                            border: Border(
                                left: BorderSide(
                                    color: Color(0xFF515CFF), width: 3.0))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '学习时长',
                              style: TextStyle(
                                  color: Color(0xFFA7A6B8),
                                  fontSize: ScreenUtil().setSp(26)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "123.5  ",
                                style: TextStyle(
                                    color: Color(0xFF515CFF),
                                    fontSize: ScreenUtil().setSp(42)),
                              ),
                              TextSpan(
                                text: "h",
                                style: TextStyle(
                                    color: Color(0xFF515CFF),
                                    fontSize: ScreenUtil().setSp(24)),
                              ),
                            ])),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    card('54', '学习时长    ', 'h'),
                    card('54', '学习时长', '次'),
                    card('54', '学习时长  ', '天'),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    card('54', '学习时长  ', '%'),
                    card('54', '学习时长', '次'),
                    card('54', '学习时长    ', '次'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF201E24),
        body: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverCustomHeaderStatusDelegate(
                tabs: _tab,
                top: _top,
                minH: ScreenUtil().setHeight(this.headerMin),
                maxH: ScreenUtil().setHeight(this.headerMax),
                thresholdValue:
                ScreenUtil().setHeight(this.headerMax - this.headerMin),
                context: context,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                key: globalKeyOne,
                width: double.infinity,
                height: ScreenUtil().setHeight(400),
                color: Colors.red,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                key: globalKeyTwo,
                width: double.infinity,
                height: ScreenUtil().setHeight(1400),
                color: Colors.green,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                key: globalKeyThree,
                width: double.infinity,
                height: ScreenUtil().setHeight(1800),
                color: Colors.grey,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                key: globalKeyFour,
                width: double.infinity,
                height: ScreenUtil().setHeight(400),
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );

  }
}

//==============================================================================SliverCustomHeaderStatusDelegate

class SliverCustomHeaderStatusDelegate extends SliverPersistentHeaderDelegate {
  BuildContext context;
  Widget tabs;
  Widget top;
  num thresholdValue;
  num minH;
  num maxH;

  SliverCustomHeaderStatusDelegate(
      {this.context,
        this.tabs,
        this.top,
        this.thresholdValue,
        this.maxH,
        this.minH});

  @override
  double get minExtent => this.minH;

  @override
  double get maxExtent => this.maxH;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  bool makeStickyTab(shrinkOffset) {
    //它代表当前头部的滚动偏移量
    if (shrinkOffset > this.thresholdValue) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        height: this.maxExtent,
        width: MediaQuery.of(context).size.width,
        child: this.makeStickyTab(shrinkOffset) ? tabs : top);
  }
}

//=====================================
class _TabView extends StatelessWidget {
  const _TabView(this.tabName, this.index);

  final String tabName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: SizedBox(
        width: ScreenUtil().setWidth(190),
        child: Text(tabName),
      ),
    );
  }
}
