
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_study/pages/animation.dart';
import 'package:flutter_study/pages/drawer.dart';
import 'package:flutter_study/pages/scale.dart';
import 'package:flutter_study/pages/sliverHeader.dart';
import '../i_router.dart';


class RootRouter implements IRouterProvider{

  static String drawer = '/drawer';

  static String animation = '/animation';

  static String scale = '/scale';

  static String sliverHeader = '/sliverHeader';

  @override
  void initRouter(Router router) {
    router.define(drawer,
        handler: Handler(handlerFunc: (_, __) => DrawerDemo()));
    router.define(animation,
        handler: Handler(handlerFunc: (_, __) => AnimationDemo()));
    router.define(scale,
        handler: Handler(handlerFunc: (_, __) => ScaleDemo()));
    router.define(sliverHeader,
        handler: Handler(handlerFunc: (_, __) => SliverHeaderDemo()));
    // router.define(bodyDataPage, handler: Handler(
    //     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //       String flag = params["flag"]?.first??'init';
    //       return BodyDataPage(flag: flag,);
    //     }));


  }
  
}