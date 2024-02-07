import 'package:flutter/material.dart';

// ScaleTransition：控制子元素放大缩小的动画组件

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

// 混入SingleTickerProviderStateMixin
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          // 表示先放大再缩小，一直循环
          ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.repeat();
          },
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: const Text('RotationTransition'),
        ),
        body: Center(
            child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          ScaleTransition(
            scale: _controller,
            // 也可以使用_controller.drive来控制_controller的起始值和结束值
            // scale: _controller.drive(Tween(begin: 0.5, end: 1.5)),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              // 其他放大缩小方式的实现
              ElevatedButton(
                  onPressed: () {
                    _controller.forward();
                  },
                  child: const Text('forward')),
              ElevatedButton(
                  onPressed: () {
                    _controller.reset();
                  },
                  child: const Text('reset')),
              ElevatedButton(
                  onPressed: () {
                    _controller.stop();
                  },
                  child: const Text('stop')),
              ElevatedButton(
                  onPressed: () {
                    _controller.reverse();
                  },
                  child: const Text('reverse'))
            ],
          )
        ])));
  }
}
