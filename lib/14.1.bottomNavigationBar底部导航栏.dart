import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutterdemo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const Tabs());
  }
}


// 实现一个可以点击的底部导航栏
class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // 初始化一个当前底部导航栏的索引值的变量
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to BeatSpy'),
        backgroundColor: Theme.of(context).primaryColor),
      body: const Text('hello world'),
      bottomNavigationBar: BottomNavigationBar(
          // 设置导航栏图标大小
          iconSize: 50,     

          // 设置导航栏图标颜色
          fixedColor: Colors.purple,

          // 控制底部导航栏的选中，1为从0开始的索引值
          // currentIndex: 1   

          // 如果底部的导航的超过3个，就要设置type参数
          type: BottomNavigationBarType.fixed,

          // onTab:点击导航栏后要实现触发的方法，点击后传入点击的索引值，并将索引值赋值给当前索引值的变量
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },

          // 将当前索引值传入currentIndex方法改变当前选中导航栏
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
          ]),
    );
  }
}
