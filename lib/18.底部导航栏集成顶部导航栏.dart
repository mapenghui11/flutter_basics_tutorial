import 'package:flutter/material.dart';
import 'pages/tab03.dart';

void main() {
  runApp(const MyApp());
}

// ====实现一个底部导航栏，集成顶部导航栏TabBar
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'flutterdemo',
        theme: ThemeData(primarySwatch: Colors.blue),
        // 调用tab03.dart的Tabs方法实现，具体实现方法查看 tab03.dart
        home: const Tabs());
  }
}