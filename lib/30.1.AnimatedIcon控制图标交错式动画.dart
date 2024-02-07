import 'package:flutter/material.dart';

// AnimatedIcon: 控制图标交错式动画的组件

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
            // reverse: true表示正向运动完后进行逆向运动
            _controller.repeat(reverse: true);
          },
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: const Text('AnimatedIcons'),
        ),
        body: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            // 图标动画组件
            AnimatedIcon(
              // close_menu表示从close图标过度到menu图标
              icon: AnimatedIcons.close_menu,
              progress: _controller,
              size: 60,
            ),
            const SizedBox(
              height: 40,
            ),
            AnimatedIcon(
              icon: AnimatedIcons.search_ellipsis,
              progress: _controller,
              size: 60,
            ),
          ],
        )));
  }
}
