import 'package:flutter/material.dart';
import 'routers/routers02.dart';

void main() {
  runApp(MyApp());
}

// 实现动态自动轮播图，具体实现查看swiper.dart
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