import 'package:flutter/material.dart';

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

// 定义一个动态列表
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // 定义一个方法，生成List，返回的值是<widget>
  List<Widget> _initListData() {
    List<Widget> list = [];

    for (var i = 0; i < 30; i++) {
      list.add(ListTile(title: Text('$i  Welcome to BeatSpy')));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _initListData(),
    );
  }
}
