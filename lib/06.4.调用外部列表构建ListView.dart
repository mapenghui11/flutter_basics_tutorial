import 'package:flutter/material.dart';
import './ListData.dart';

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

// 
// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // 调用listData，并使用ListView.builder构建ListView来实现动态列表
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Image.network(listData[i]['ImageUrl']),
            title: Text(listData[i]['title']),
            subtitle: Text(listData[i]['text']),
          );
        });
  }
}
