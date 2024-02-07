import 'package:flutter/material.dart';
import './pages/tab.dart';

void main() {
  runApp(const MyApp());
}

// 实现点击不同的导航按钮切换到不同的页面，即调用/加载对应的页面/组件
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




