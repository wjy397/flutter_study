import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Constant {
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction  = kReleaseMode;

  static const requestBaseUrl = 'http://127.0.0.1:9999';


  static bool isDriverTest  = false;
  static bool isUnitTest  = false;

  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';

  static const String keyGuide = 'keyGuide';
  static const String userName = 'username';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  static const int pageSize = 6;

  static const String theme = 'AppTheme';
  static const appBarColor = Color(0xff4169e2);

  static const Color fixedColor = Colors.blue;

  static const bgColor = Color(0xFF201E24);

  static const mainSpace = 10.0;

  static const mainLineWidth = 0.3;

  static const lineColor = Colors.grey;

  static const mainTextColor = Color.fromRGBO(115, 115, 115, 1.0);

  static const defImg = 'http://www.flutterj.com/content/templates/emlog_dux/images/random/1.jpg';

}


