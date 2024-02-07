import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// AnimatedOpacity设置渐变动画
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
      // Opacity组件用于设置透明度
      // AnimatedOpacity组件设置透明度的渐变动画
      body: Center(
        child: AnimatedOpacity(
        opacity: flag?0.2:1,
        duration: const Duration(seconds: 1),
        curve: Curves.easeIn,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      )
      ),
    );
  }
}
