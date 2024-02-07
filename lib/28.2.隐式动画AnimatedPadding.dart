import 'package:flutter/material.dart';

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
  // 定义一个flag判断按钮状态，点击按钮时对flag进行取反
  // 取反后在padding属性中使用三目运算符对容器进行动画设置
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
      body: AnimatedPadding(
        // 设置位移样式
        curve: Curves.bounceInOut,
        // 设置动画执行前后容器的边距
        padding: EdgeInsets.fromLTRB(10, flag?10:400, 0, 0),
        // 动画执行时间
        duration: const Duration(seconds: 3),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}
