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
      home: const HomePage(),
    );
  }
}

// 有状态组件：使用StatefulWidget实现一个按钮点击计数器
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 定义计数器的初始值
  int _numCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 给静态值加上const后每次重新调用build方法都不会重新加载
        title: const Text('Welcome to Best Spy'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_numCount',
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 60),
            ElevatedButton(
                onPressed: () {
                  // 改变数据必须加上setState
                  setState(() {
                    _numCount++;
                  });
                },
                child: const Text('Add'))
          ],
        ),
      ),
      // 创建一个浮动按钮，floatingActionButton需要在Scaffold中实现
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _numCount++;
            });
          },
          child: const Icon(Icons.add)),
    );
  }
}
