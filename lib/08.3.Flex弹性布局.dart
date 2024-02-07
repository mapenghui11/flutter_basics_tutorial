import 'package:flutter/material.dart';

/*  弹性布局：Flex组件

  Flex组件可以沿着水平或垂直方向排列子组件，
  Row和column都继承自Flex，参数基本相同，
      所以能使用Flex的地方基本上都可以使用Row或 column，
  Flex 和 Expanded 组件配合实现弹性布局。

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
    // ====// 两个元素使用弹性布局
    // return Flex(  
    //     direction: Axis.horizontal,     // 设置水平弹性布局
    //     children: [
    //       // 弹性布局：Icons.home占三分之一，Icons.radar占三分之二
    //       // 设置宽度是没有效果的
    //       Expanded(
    //         flex: 1,
    //         child: IconContainer(Icons.home, color: Colors.blue),
    //       ),
    //       Expanded(
    //         flex: 2,
    //         child: IconContainer(Icons.radar, color: const Color.fromARGB(255, 33, 229, 243)),
    //       )
    //     ],
    //   );


    // ====一个元素使用弹性布局，一个元素固定大小
    // 可以return Row，也可以return Column，或者return Flex
    return Row(  
        children: [
          Expanded(
            flex: 1,
            child: IconContainer(Icons.home, color: Colors.blue),
          ),
          IconContainer(Icons.radar, color: const Color.fromARGB(255, 33, 229, 243))
        ],
      );
  }
}


// 通过命名参数实现调用IconContainer时可以传入不同的背景颜色和图标
// ignore: must_be_immutable
class IconContainer extends StatelessWidget {
  Color color;
  IconData icon;
  // 将color定义成命名参数，required关键词表示一定要传入的参数
  // icon不能定义成命名参数，所以在前面传入
  IconContainer(this.icon, {Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 120,
        width: 120,
        color: color,
        child: Icon(icon, color: Colors.purple, size: 28));
  }
}