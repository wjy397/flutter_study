
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';


import 'demo/root_router.dart';
import 'i_router.dart';
import 'not_found_page.dart';

// ignore: avoid_classes_with_only_static_members
class Routes {

  static String login = '/login';
  static String home = '/home';
  static String webViewPage = '/webView';

  static final List<IRouterProvider> _listRouter = [];

  static final Router router = Router();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        debugPrint('未找到目标页');
        return NotFoundPage();
      });

    // router.define(home, handler: Handler(
    //   handlerFunc: (BuildContext context, Map<String, List<String>> params) => Home()));
    // router.define(login, handler: Handler(
    //     handlerFunc: (BuildContext context, Map<String, List<String>> params) => LoginPage()));
    // router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
    //   final String title = params['title']?.first;
    //   final String url = params['url']?.first;
    //   return WebViewPage(title: title, url: url);
    // }));
    
    _listRouter.clear();
    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(RootRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
