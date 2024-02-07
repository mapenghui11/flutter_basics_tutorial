import 'package:flutter/material.dart';
import 'routers/routers00.dart';

void main() {
  runApp(MyApp());
}

// 命名路由传值：
// 将路由配置和onGenerateRoute配置单独抽离成一个文件：./routers/routers.dart
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutterdemo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      // 配置onGenerateRoute  固定写法
      onGenerateRoute: onGenerateRoute
    );
  }
}
