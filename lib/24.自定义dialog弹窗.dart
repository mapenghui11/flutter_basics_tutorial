import 'package:flutter/material.dart';
import 'routers/routers01.dart';

void main() {
  runApp(MyApp());
}

// 自定义dialog弹窗，具体实现查看dialog.dart和myDialog.dart
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutterdemo',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        // 配置onGenerateRoute  固定写法
        onGenerateRoute: onGenerateRoute);
  }
}
