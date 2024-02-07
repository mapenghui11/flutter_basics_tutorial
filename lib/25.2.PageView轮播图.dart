import 'package:flutter/material.dart';
import 'routers/routers02.dart';

void main() {
  runApp(MyApp());
}

// 实现轮播图，以及无限加载的轮播图，并且底部轮播导航会随着当前显示图片变亮
// 具体实现查看pageViewSwiper.dart和pageViewSwiperFull.dart
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