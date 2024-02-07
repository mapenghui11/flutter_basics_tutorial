import 'package:flutter/material.dart';

// SlideTransition：控制子元素位移的动画组件

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
    _controller = AnimationController(
      // 让程序和手机的刷新频率一致
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.addListener(() {
      print(_controller.value);
    });
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
            child: Column(
          children: [
            // 设置元素的位移
            SlideTransition(
                // position: _controller.drive(Tween(
                //     // 表示x轴向右位移容器宽度的0.5倍，也就是向右位移100
                //     // Offest设置的是位移的量和运动方向
                //     begin: const Offset(0, 0), end: const Offset(0.5, 0))),

                // position的另一种配置方法
                position:
                    Tween(begin: const Offset(0, 0), end: const Offset(0.5, 0))
                        // 链式操作
                        // 配置动画样式 
                        .chain(CurveTween(curve: Curves.bounceIn))
                        // 当前动画执行时间的百分之40开始运动，最后百分之60时结束运动
                        .chain(CurveTween(curve: const Interval(0.4, 0.6)))
                        .animate(_controller),
                child: const FlutterLogo(
                  size: 200,
                )),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                // 其他位移方式的实现
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
          ],
        )));
  }
}
