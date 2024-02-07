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
        body: MyHomePage(),
      ),
    );
  }
}


/* 使用 ListView.builder 构造一个ListView。

    itemCount: list.length 指定了ListView的子项数量，即list中元素的个数。

    itemBuilder: 接受一个回调函数，用于构建每个列表项。即构建一个ListTile。
      context：BuildContext对象，提供了构建上下文信息，例如主题、定位等。
      index：当前构建项的索引。
*/ 


// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  // 创建一个MyHomePage实例时，生成一个包含20个字符串的列表list
  List<String> list = [];
  MyHomePage({Key? key}) : super(key:key) {
    for (var i = 0; i < 20; i++) {
      list.add('Welcome to BeatSpy -- $i');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(list[index])
        );
      }
    );
  }
}
