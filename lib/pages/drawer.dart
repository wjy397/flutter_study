import 'package:flutter/material.dart';
import 'package:flutter_study/pages/widgets/subject_item.dart';

class DrawerDemo extends StatefulWidget {
  DrawerDemo({Key key}) : super(key: key);

  @override
  _DrawerDemoState createState() {
    return _DrawerDemoState();
  }
}

class _DrawerDemoState extends State<DrawerDemo> {
  //所有抽屉
  List allSubject = [
    {'id': 1, 'subject_name': '抽屉1', 'showBottm': false},
    {'id': 2, 'subject_name': '抽屉2', 'showBottm': false},
    {'id': 3, 'subject_name': '抽屉3', 'showBottm': false},
    {'id': 4, 'subject_name': '抽屉4', 'showBottm': false},
    {'id': 5, 'subject_name': '抽屉5', 'showBottm': false},
    {'id': 6, 'subject_name': '抽屉6', 'showBottm': false},
    {'id': 7, 'subject_name': '抽屉7', 'showBottm': false},
    {'id': 8, 'subject_name': '抽屉8', 'showBottm': false},
    {'id': 9, 'subject_name': '抽屉9', 'showBottm': false}
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //点击抽屉的回调函数
  clickBack(bool flag, int id) {
    var tmp = [];
    for (int i = 0; i < allSubject.length; i++) {
      if (allSubject[i]['id'] == id) {
        var item = allSubject[i];
        if (flag == true) {
          item['showBottm'] = true;
        } else {
          item['showBottm'] = false;
        }
        tmp.add(item);
      } else {
        tmp.add(allSubject[i]);
      }
    }
    setState(() {
      allSubject = tmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: allSubject.map((e) {
              return SubjectItem(
                key: Key(e['id'].toString()),
                callBack: clickBack,
                showBottm: e['showBottm'],
                name: e['subject_name'],
                id: e['id'],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
