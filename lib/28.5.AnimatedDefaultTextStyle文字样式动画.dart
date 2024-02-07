import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// AnimatedDefaultTextStyle设置TextStyle文字样式的动画
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
        body: Center(
          child: Container(
              alignment: Alignment.center,
              width: 300,
              height: 300,
              color: Colors.blue,
              child: AnimatedDefaultTextStyle(
                // 动画执行时所有TextStyle内定义的属性都可以改变
                style: TextStyle(
                    fontSize: flag ? 20 : 60,
                    color: flag?const Color.fromARGB(255, 169, 216, 255):Colors.blue),
                duration: const Duration(seconds: 1),
                child: const Text('hello web3'),
              )),
        ));
  }
}
