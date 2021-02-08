import 'package:flutter/material.dart';


class NotFoundPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text("页面未找到"),
      ),
      body: Center(
      child: Text('页面未找到'),
    ),
    );
  }
}




