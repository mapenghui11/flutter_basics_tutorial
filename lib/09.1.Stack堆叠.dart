import 'package:flutter/material.dart';

/* Stack组件: Stack表示堆的意思，可以用Stack/Stack结合Align/Stack结合 Positiond来实现页面的定位布局

  属性:
  1. alignment: 配置所有子元素的显示位置

  2. children: 子组件

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
    // Stack：两个元素堆叠排列
    return Stack(
      // 最大的元素居左，其余子元素相对居中
      alignment: Alignment.center,
      children: [
        Container(height: 200, width: 200, color: Colors.blueGrey),
        Container(height: 140, width: 140, color: const Color.fromARGB(255, 59, 77, 86)),
        const Text('Hello User')
      ],
    );
  }
}
