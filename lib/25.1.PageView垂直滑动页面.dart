import 'package:flutter/material.dart';
import 'routers/routers02.dart';

void main() {
  runApp(MyApp());
}

/*  Flutter中的轮动图以及上下滑页切换视频等等，都可以通过 PageView 实现

PageView常见属性:

1. scrollDirection         Axis.horizonta水平方向 Axis.vertical锤子方向

2. children                配置子元素

3. allowlmplicitScrolling  缓存当前页面的前后两页

4. onPageChanged page      改变的时候触发

*/


// 实现PageView垂直滑动页面，PageViewBuild遍历，PageViewFull无线加载页面，
// 具体实现查看pageView.dart，pageViewBuild.dart和pageViewFull.dart页面文件和user.dart和routers02.dart
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