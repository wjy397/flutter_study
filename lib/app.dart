
import 'package:flutter/material.dart';
import 'package:flutter_study/pages/home.dart';
import 'package:flutter_study/routes/routers.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/screenutil.dart';

import 'config/const.dart';


final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp() {
    Routes.initRoutes();
  }
  @override
  Widget build(BuildContext context) {

    return OKToast(
        child:MaterialApp(
          debugShowCheckedModeBanner: false,//去掉右上角的DEBUG标签
          title: 'flutter 编程笔记',
          theme: ThemeData(
            indicatorColor: Constant.appBarColor,//TabBar中选项选中的指示器颜色。
            scaffoldBackgroundColor: Constant.bgColor, //用于materia应用程序或app内页面的背景色。
            hintColor: Colors.grey.withOpacity(0.3),//用于提示文本或占位符文本的颜色，例如在TextField中
            splashColor: Colors.transparent,//墨水溅出的颜色
            canvasColor: Colors.transparent,//MaterialType.canvas Material的默认颜色。
          ),
          onGenerateRoute: Routes.router.generator,
          navigatorKey: navigatorKey,
          home: new Home(),
        ));
  }

  // void initDio() {
  //   final List<Interceptor> interceptors = [];
  //   /// 统一添加身份验证请求头
  //   interceptors.add(AuthInterceptor());
  //   /// 刷新Token
  //   interceptors.add(TokenInterceptor());
  //   /// 打印Log(生产模式去除)
  //   if (!Constant.inProduction) {
  //     interceptors.add(LoggingInterceptor());
  //   }
  //   /// 适配数据(根据自己的数据结构，可自行选择添加)
  //   interceptors.add(AdapterInterceptor());
  //   setInitDio(
  //     baseUrl: Constant.requestBaseUrl,
  //     interceptors: interceptors,
  //   );
  // }
}