
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../i_router.dart';


class RootRouter implements IRouterProvider{

  static String bodyDataPage = '/root/bodyData';

  
  @override
  void initRouter(Router router) {
    // router.define(bodyDataPage, handler: Handler(
    //     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //       String flag = params["flag"]?.first??'init';
    //       return BodyDataPage(flag: flag,);
    //     }));


  }
  
}