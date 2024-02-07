import 'package:flutter/material.dart';

/* 列表布局: 通过ListView来定义列表项，支持垂直和水平方向:

  1、垂直列表

  2、垂直图文列表

  3、水平列表

  4、动态列表


  列表组件常用参数：
        名称            类型                         说明
  1. scrollDirection   Axis                   Axis.horizontal水平列表，Axis.vertical垂直列表
  2. padding           EdgelnsetsGeometry     内边距
  3. resolve           bool                   组件反向排序
  4. children          List                   列表元素

*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Best Spy'),
          // 设置背景颜色：获取当前上下文中应用程序主题的主要颜色。
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(title: Text('Welcome to Best Spy')),
        // 加上下划线
        Divider(),
        ListTile(title: Text('Welcome to Best Spy')),
        Divider(),
        ListTile(title: Text('Welcome to Best Spy')),
        Divider(),
        ListTile(
          leading: Icon(Icons.home, color: Colors.purple),
          title: Text('首页'),
          trailing: Icon(Icons.chevron_right_sharp, color: Colors.purple),
        ),
        Divider(),
        ListTile(
            leading: Icon(Icons.assignment, color: Colors.purple),
            title: Text('全部订单'),
            trailing: Icon(Icons.chevron_right_sharp, color: Colors.purple)),
        Divider(),
        ListTile(
            leading: Icon(Icons.payment, color: Colors.purple),
            title: Text('待付款'),
            trailing: Icon(Icons.chevron_right_sharp, color: Colors.purple)),
        Divider(),
        ListTile(
            leading: Icon(Icons.favorite, color: Colors.purple),
            title: Text('我的收藏'),
            trailing: Icon(Icons.chevron_right_sharp, color: Colors.purple)),
        Divider(),
        ListTile(
            leading: Icon(Icons.people, color: Colors.purple),
            title: Text('联系客服'),
            trailing: Icon(Icons.chevron_right_sharp, color: Colors.purple)),
        Divider(),
      ],
    );
  }
}
