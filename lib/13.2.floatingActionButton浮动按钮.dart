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

// 有状态组件：使用StatefulWidget实现一个按钮点击增加列表元素
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 因为final的特性，就算是常量也可以增加数据改变值
  final List<String> _list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Best Spy'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        /* 遍历_list，将 _list中的每个字符串映射为一个ListTile 组件，

          并将结果转换为一个List，因为body是ListView结构，
          
          value表示 _list 中的每个元素
        */
          children: _list.map((value) {
        return ListTile(
          title: Text(value),
        );
      }).toList()),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _list.add('Welcome to Best Spy');
            });
          },
          child: const Icon(Icons.add)),
    );
  }
}
