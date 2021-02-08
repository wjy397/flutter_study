
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_study/pages/drawer.dart';
import '../i_router.dart';


class RootRouter implements IRouterProvider{

  static String drawer = '/drawer';

  
  @override
  void initRouter(Router router) {
    router.define(drawer,
        handler: Handler(handlerFunc: (_, __) => DrawerDemo()));
    // router.define(bodyDataPage, handler: Handler(
    //     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //       String flag = params["flag"]?.first??'init';
    //       return BodyDataPage(flag: flag,);
    //     }));


  }
  
}