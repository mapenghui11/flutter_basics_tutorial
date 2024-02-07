import 'package:flutter/material.dart';

/*
  隐式动画：

  FLutter中提供的 
  AnimatedContainer、AnimatedPadding、AnimatedPositioned、
  AnimatedOpacity、AnimatedDefaultTextStyle、AnimatedSwitcher都属于隐式动画，

  隐式动画中可以通过 duration 配置动画时长、可以通过curve (曲线)来配置动画过程
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 定义一个flag判断按钮状态，点击按钮时对flag进行取反，取反后使用三目运算符对容器进行动画设置
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              // 对flag进行取反
              flag = !flag;
            });
          },
        ),
        appBar: AppBar(
          title: const Text('Title'),
        ),
        // body: Center(
        //   // 设置容器组件动画的放大缩放，和位移
        //   child: AnimatedContainer(
        //     duration: const Duration(milliseconds: 100),
        //     width: flag?200:300,
        //     height: flag?200:300,
        //     // 设置位移，向右位移60
        //     transform: flag?Matrix4.translationValues(0, 0, 0):Matrix4.translationValues(60, 0, 0),
        //     color: Colors.blue,
        //   ),
        // ));

        // 使用AnimatedContainer实现弹出侧边栏的功能
        // (如果想要弹出的侧边栏将appBar也盖住，可以把Scaffold组件放在Stack中)
        body: Stack(children: [
          ListView(
            children: const [
              ListTile(
                title: Text('我是一个列表'),
              )
            ],
          ),
          Positioned(
            // 表示竖屏弹出
            left: 0,
            top: 0,
            bottom: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: 220,
              height: 500,
              // 先让容器隐藏起来，在点击按钮后弹出
              transform: flag
                ? Matrix4.translationValues(-220, 0, 0)
                : Matrix4.translationValues(0, 0, 0),
            color: const Color.fromARGB(255, 71, 78, 84),
          ))
        ]));
  }
}
