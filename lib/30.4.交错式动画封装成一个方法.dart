import 'package:flutter/material.dart';

// 使用自定义交错式动画实现多个容器的连续移动，并封装成一个方法

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
  bool flag = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // _controller.addListener(() {
    //   print(_controller.value);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            flag ? _controller.repeat(reverse: true) : _controller.stop();
            flag = !flag;
          },
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: const Text('AnimatedIcons'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlidingBox(
                controller: _controller,
                color: Colors.blue[50],
                curve: const Interval(0, 0.3)),
            SlidingBox(
                controller: _controller,
                color: Colors.blue[100],
                curve: const Interval(0.3, 0.5)),
            SlidingBox(
                controller: _controller,
                color: Colors.blue[200],
                curve: const Interval(0.4, 0.6)),
            SlidingBox(
                controller: _controller,
                color: Colors.blue[300],
                curve: const Interval(0.5, 0.7)),
            SlidingBox(
                controller: _controller,
                color: Colors.blue[400],
                curve: const Interval(0.6, 0.8)),
            SlidingBox(
                controller: _controller,
                color: Colors.blue[500],
                curve: const Interval(0.7, 1)),
          ],
        )));
  }
}

// 交错式动画方法
class SlidingBox extends StatelessWidget {
  // controller不能定义成私有，不然外部无法访问
  final AnimationController controller;
  // color要定义成可空类型
  final Color? color;
  final Curve curve;
  const SlidingBox(
      {super.key,
      required this.controller,
      required this.color,
      required this.curve});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: controller.drive(
          Tween(begin: const Offset(0, 0), end: const Offset(0.8, 0))
              .chain(CurveTween(curve: curve))),
      child: Container(
        width: 140,
        height: 60,
        color: color,
      ),
    );
  }
}
