import 'package:flutter/material.dart';
import './pages/tab02.dart';

void main() {
  runApp(const MyApp());
}

/*  UserAccountsDrawerHeader：配置侧边栏顶部布局的组件

  1. decoration：设置顶部背景颜色

  2. accountName：账户名称

  3. accountEmail：账户邮箱

  4. currentAccountPicture：用户头像

  5. otherAccountsPictures：用来设置当前账户其他账户头像
*/

// 实现侧边栏和侧边栏的布局和侧边栏的个人主页布局
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutterdemo',
        theme: ThemeData(primarySwatch: Colors.blue),
        // 调用tab02.dart的TabDrawer方法实现，具体实现方法查看tab02.dart
        home: const TabDrawer());
  }
}