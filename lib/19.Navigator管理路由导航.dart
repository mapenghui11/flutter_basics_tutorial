import 'package:flutter/material.dart';
import 'pages/tab.dart';

/*  Flutter中的路由就是页面跳转。
  在Flutter中通过Navigator组件管理路由导航。并提供了管理堆栈的方法。
  如: Navigator.push和Navigitor.pop，

  Navigator.pop方法：返回上一页面
  Navigator.push：跳转页面

  另外，Flutter中提供了两种配置路由跳转的方式: 1、基本路由 2、命名路由
*/


void main() {
  runApp(const MyApp());
}

// ====实现底部导航栏分类选项的按钮页面跳转，具体实现查看‘./tabs/category’和其他要跳转到的页面form，news，search
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutterdemo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const Tabs());
  }
}