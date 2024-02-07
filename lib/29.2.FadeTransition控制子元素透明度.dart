import 'package:flutter/material.dart';

// FadeTransition：控制子元素透明度的动画组件

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
        // 设置透明度初始值和结束值，_controller的值在0到1之间，RotationTransition也可以设置但是用处不大
        lowerBound: 0.3,
        upperBound: 1);
    // ..repeat();  可以使用连缀操作..repeat()直接让图标改变透明度

    // addListener方法监听_controller透明度的值
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
            // 改变透明度
            FadeTransition(
                opacity: _controller,
                child: const FlutterLogo(
                  size: 200,
                )),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                // 其他旋转方式的实现
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
