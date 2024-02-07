import 'package:flutter/material.dart';

/* Stack组件中结合Positioned组件控制每个子元素的显示位置:

  属性:
  1. top  子元素距离顶部的距离

  2. bottom 子元素距离底部的距离

  3. left 子元素距离左侧距离

  4. right  子元素距离右侧距离

  5. width  组件的宽度 (宽度和高度必须是固定值，没法使用double.infinity)
  
  6. height 子组件的高度

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
    return Container(
        height: 400,
        width: 300,
        color: Colors.blueGrey,
        // 相对于外部容器进行定位，如果没有外部容器就相对于整个屏幕进行定位
        child: Stack(
          children: [
            Positioned(
              // left: 0, bottom: 0表示居于底部左侧
              left: 0,
              bottom: 0,
              child: Container(
              height: 140,
              width: 140,
              color: const Color.fromARGB(255, 63, 82, 91),
            )),
            const Positioned(
              right: 0,
              top: 190,
              child: Text('Hello User'))
          ],
        ));
  }
}
