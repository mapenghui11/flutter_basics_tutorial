import 'package:flutter/material.dart';

// 自定义交错式动画AnimatedIcon

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
            // _controller.forward();

            // 使用三目运算符控制动画正反向运动
            // 第一次点击flag为true，执行_controller.forward()动画执行一次，flag被取反赋值为为false，
            // 第二次点击flag为false，执行_controller.reverse()动画反向执行一次
            flag ? _controller.forward() : _controller.reverse();
            flag = !flag;
          },
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: const Text('AnimatedIcons'),
        ),
        body: Center(
            child: Stack(
          children: [
            ScaleTransition(
                // 使用Tween和chain链式操作实现两个图标的转换
                /*
                   Tween(begin: 1.0, end: 0.0)从0到1表示search图标消失，
                   Interval(0, 0.5)表示消失时间在 0 到 1秒 * 0.5倍时间，1秒是动画执行时间
                */
                scale: _controller.drive(Tween(begin: 1.0, end: 0.0)
                    .chain(CurveTween(curve: const Interval(0, 0.5)))),
                child: const Icon(Icons.search, size: 40)),
                /*
                  同理，表示在0.5秒到1秒的时间内close图标从0到1出现
                */
            ScaleTransition(
                scale: _controller.drive(Tween(begin: 0.0, end: 1.0)
                    .chain(CurveTween(curve: const Interval(0.5, 1)))),
                child: const Icon(Icons.close, size: 40)),
          ],
        )));
  }
}
