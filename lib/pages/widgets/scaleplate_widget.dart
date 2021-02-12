import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaleplateWidget extends StatefulWidget {
  final double width;
  final double height;

  ScaleplateWidget(
      {Key key,
      this.height,
      this.width,})
      : super(key: key);

  @override
  _ScaleplateWidgetState createState() {
    return _ScaleplateWidgetState();
  }
}

class _ScaleplateWidgetState extends State<ScaleplateWidget> {
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
    return Container(
      // color: Colors.grey,
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              width: 100,
              height: widget.height,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
              ),
            ),
          ),
          ListView.builder(
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            itemCount: 11,
            itemBuilder: (BuildContext context, int index) {
              //首尾空白元素
              int type;
              Color colorType;
              //第一个普通元素
              if (index == 0) {
                type = 0;
                //最后一个普通元素
              } else if (index == 10) {
                type = 2;
                //中间普通元素
              } else {
                type = 1;
              }
              if (index < 5) {
                colorType = Color(0xFF55D160);
              } else if (index > 6) {
                colorType = Color(0xFFFF2C2C);
              } else {
                colorType = Color(0xFFFFA82C);
              }

              return Container(
                child: NumberPickerItem(
                  subGridCount: 10,
                  subGridWidth: 5,
                  itemWidth: widget.width.toInt(),
                  valueStr: ((10 - index) * 10).toString() + '分',
                  type: type,
                  colorType: colorType,
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
//------------------------------------------------------------------------------

///每个item中间为长刻度，并在下方显示数值。两边都是短刻度
class NumberPickerItem extends StatelessWidget {
  final int subGridCount;
  final int subGridWidth;
  final int itemWidth;
  final String valueStr;

  //0:列表首item 1:中间item 2:尾item
  final int type;

  final Color colorType;

  const NumberPickerItem({
    Key key,
    @required this.subGridCount,
    @required this.subGridWidth,
    @required this.itemWidth,
    @required this.valueStr,
    @required this.type,
    @required this.colorType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemWidth = this.itemWidth.toDouble();
    double itemHeight = (subGridWidth * subGridCount).toDouble();

    return CustomPaint(
      size: Size(itemWidth, itemHeight),
      painter: MyPainter(this.subGridWidth, this.valueStr,
          this.type, this.colorType),
    );
  }
}

class MyPainter extends CustomPainter {
  final int subGridWidth;

  final String valueStr;


  //0:列表首item 1:中间item 2:尾item
  final int type;

  final Color colorType;

  Paint _linePaint;

  double _lineWidth = 2;

  MyPainter(this.subGridWidth, this.valueStr, this.type,
      this.colorType) {
    _linePaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = _lineWidth
      ..color = colorType;
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawLine(canvas, size);
    drawText(canvas, size);
  }

  void drawLine(Canvas canvas, Size size) {
    double startY, endY;
    switch (type) {
      case 0: //首元素只绘制右半部分
        startY = size.height / 2;
        endY = size.height;
        break;
      case 2: //尾元素只绘制左半部分
        startY = 0;
        endY = size.height / 2;
        break;
      default: //中间元素全部绘制
        startY = 0;
        endY = size.height;
    }

    //绘制竖线
    for (double y = startY; y <= endY; y += subGridWidth) {
      if (y == size.height / 2) {
        //中间为长刻度
        canvas.drawLine(Offset(size.width - 100, y),
            Offset(size.width - 100 + size.height * 3 / 5, y), _linePaint);
      } else {
        //其他为短刻度
        canvas.drawLine(Offset(size.width - 100, y),
            Offset(size.width - 100 + size.height / 3, y), _linePaint);
      }
    }
  }

  void drawText(Canvas canvas, Size size) {
    //文字水平方向居中对齐，竖直方向底对齐
    ui.Paragraph p = _buildText(valueStr, size.width);
    //获得文字的宽高
    double halfWidth = p.minIntrinsicWidth / 2;
    double halfHeight = p.height / 2;
    canvas.drawParagraph(
        p, Offset(size.width - 160, size.height / 2 - halfHeight));
  }

  ui.Paragraph _buildText(String content, double maxWidth) {
    ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(ui.ParagraphStyle());
    paragraphBuilder.pushStyle(
      ui.TextStyle(
        fontSize: 14,
        color: colorType,
        //fontFamily: "Montserrat",
      ),
    );
    paragraphBuilder.addText(content);

    ui.Paragraph paragraph = paragraphBuilder.build();
    paragraph.layout(ui.ParagraphConstraints(width: maxWidth));

    return paragraph;
  }



  ui.Paragraph _buildGradeText(String content, double maxWidth) {
    ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(ui.ParagraphStyle());
    paragraphBuilder.pushStyle(
      ui.TextStyle(
        fontSize: 14,
        color: Color(0xFFBBB3CA),
        //fontFamily: "Montserrat",
      ),
    );
    paragraphBuilder.addText(content);

    ui.Paragraph paragraph = paragraphBuilder.build();
    paragraph.layout(ui.ParagraphConstraints(width: maxWidth));

    return paragraph;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
