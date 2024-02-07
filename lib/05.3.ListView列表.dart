import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Best Spy'),
          // 设置背景颜色：获取当前上下文中应用程序主题的主要颜色。
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
    return ListView(
      padding: const EdgeInsets.all(10),
      // <Widget>表示可以传入任意组件
      children: <Widget>[
        Image.network('https://i.seadn.io/s/raw/files/46b0f4f92782fe9c9a609e909a98764a.png?auto=format&dpr=1&w=1000'),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          height: 40,
          // 在垂直列表中width宽度是自适应的，无法修改
          // width: 120,
          child: const Text(
            'Anonthology', 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Image.network('https://i.seadn.io/s/raw/files/9573b5e8337876376602f8f2f57190a7.png?auto=format&dpr=1&w=1000'),
          Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          height: 40,
          child: const Text(
            'EigenLayer World Builders', 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Image.network('https://metadata.y00ts.com/y/9528.png'),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          height: 40,
          child: const Text(
            'y00ts', 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Image.network('https://images.blur.io/_blur-prod/0x524cab2ec69124574082676e6f654a18df49a048/46-b16b3047b2abc1dd?w=1024'),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          height: 40,
          child: const Text(
            'LilPudgys', 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Image.network('https://images.blur.io/_blur-prod/0x4481507cc228fa19d203bd42110d679571f7912e/1387-26a9fb53668d0e10?w=512'),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          height: 40,
          child: const Text(
            'Neo Tokyo Outer Citizens', 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}