import 'package:flutter/material.dart';

// RotationTransition：控制子元素旋转的动画组件

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

// 1. 混入SingleTickerProviderStateMixin
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // 2. 定义 _controller，_controller的值在0到1之间变化
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 3. 传入_controller对应的值
    _controller = AnimationController(
        // 让程序和手机的刷新频率一致
        vsync: this,
        duration: const Duration(seconds: 1));
    // ..repeat();  可以使用连缀操作..repeat()直接让图标旋转起来
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // // 调用repeat表示重复运动
            _controller.repeat();
            // // 调用forward表示运动一次
            // _controller.forward();
            // // 调用reset表示重置
            // _controller.reset();
            // // 调用stop表示停止运动
            // _controller.stop();
            // // 调用reverse表示翻转运动
            // _controller.reverse();
          },
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: const Text('RotationTransition'),
        ),
        body: Center(
            child: Column(
          children: [
            RotationTransition(
                // 4. 在对应组件的属性中调用_controller
                turns: _controller,
                child: const FlutterLogo(
                  size: 200,
                )),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                // 其他旋转方式的按钮实现
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
