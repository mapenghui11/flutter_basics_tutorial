import 'package:flutter/material.dart';
import 'pages/tab.dart';

void main() {
  runApp(const MyApp());
}

// ====实现一个可以点击的底部导航栏，中间菜单为突起显示的图标，且可以随着点击变色
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutterdemo',
        theme: ThemeData(primarySwatch: Colors.blue),
        // 调用tab.dart的Tabs方法实现，具体实现方法查看 tab.dart
        home: const Tabs());
  }
}