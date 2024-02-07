import 'package:flutter/material.dart';

// 使用自定义交错式动画实现多个容器的连续移动

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
      duration: const Duration(seconds: 1),
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
            flag ? _controller.repeat(reverse: true) : _controller.reverse();
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
            SlideTransition(
              position: _controller.drive(
                  // 在0到0.2秒的时间内容器向右位移0.5个width，也就是向右位移60
                  Tween(begin: const Offset(0, 0), end: const Offset(0.5, 0))
                      .chain(CurveTween(curve: const Interval(0, 0.2)))),
              child: Container(
                width: 120,
                height: 60,
                color: Colors.blue[100],
              ),
            ),
            SlideTransition(
              position: _controller.drive(
                  Tween(begin: const Offset(0, 0), end: const Offset(0.5, 0))
                      .chain(CurveTween(curve: const Interval(0.2, 0.4)))),
              child: Container(
                width: 120,
                height: 60,
                color: Colors.blue[200],
              ),
            ),
            SlideTransition(
              position: _controller.drive(
                  Tween(begin: const Offset(0, 0), end: const Offset(0.5, 0))
                      .chain(CurveTween(curve: const Interval(0.4, 0.6)))),
              child: Container(
                width: 120,
                height: 60,
                color: Colors.blue[300],
              ),
            ),
            SlideTransition(
              position: _controller.drive(
                  Tween(begin: const Offset(0, 0), end: const Offset(0.5, 0))
                      .chain(CurveTween(curve: const Interval(0.6, 0.8)))),
              child: Container(
                width: 120,
                height: 60,
                color: Colors.blue[400],
              ),
            ),
            SlideTransition(
              position: _controller.drive(
                  Tween(begin: const Offset(0, 0), end: const Offset(0.5, 0))
                      .chain(CurveTween(curve: const Interval(0.8, 1)))),
              child: Container(
                width: 120,
                height: 60,
                color: Colors.blue[500],
              ),
            ),
          ],
        )));
  }
}
