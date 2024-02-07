import 'package:flutter/material.dart';
import 'routers/routers01.dart';

void main() {
  runApp(MyApp());
}

// flutter弹窗：具体实现查看dialog.dart页面文件
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
