import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// AnimatedPositioned设置移动位置动画，实现类似于加入购物车的动画
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
      body: Stack(
        children: [
          AnimatedPositioned(
              right: flag?10:300,
              top: flag?10:650,
              duration: const Duration(milliseconds: 800),
              curve: Easing.emphasizedAccelerate,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              )),
          ListView(
            children: const [
              ListTile(
                title: Text('我是一个列表'),
              ),
              ListTile(
                title: Text('我是一个列表'),
              ),
              ListTile(
                title: Text('我是一个列表'),
              ),
              ListTile(
                title: Text('我是一个列表'),
              )
            ],
          )
        ],
      ),
    );
  }
}
