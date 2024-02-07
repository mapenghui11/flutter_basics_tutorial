import 'package:flutter/material.dart';

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
    // ===使用Align实现两个元素分别居左居右：
    // return Container(
    //     width: 300,
    //     height: 300,
    //     color: Colors.blueGrey,
    //     child: const Align(
    //       // alignment: Alignment(1, 1),   (1, 1)表示右下角
    //       alignment: Alignment.center,
    //       child: Text('hello flutter'),
    //     ));

    // ===使用Stack结合Align实现两个元素分别居左居右：
    // return const Stack(
    //   children: [
    //     Align(alignment: Alignment.topLeft, child: Text('登录')),
    //     Align(alignment: Alignment.topRight, child: Text('注册'))
    //   ],
    // );

    /* ===使用Stack结合Positioned实现两个元素分别居左居右，
      并定义一个SizedBox来控制Stack的相对位置
    */
    return const SizedBox(
      width: double.infinity,
      height: 40,
      child: Stack(
        children: [
          Positioned(left: 30, child: Text('登录')),
          Positioned(right: 30, child: Text('注册')),
        ],
      ),
    );
  }
}
