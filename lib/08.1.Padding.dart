import 'package:flutter/material.dart';

/*  Padding组件：处理容器与子元素之间的间距

  1. padding：padding值,Edgelnsetss设置填充的值
  2. child:子组件

*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Best Spy'),
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
    return const Padding(
      // Padding组件功能单一，调用Padding相比Container内存占用更小
      padding: EdgeInsets.all(20),
      child: Text('hello 0xMaph'),
    );
  }
}
