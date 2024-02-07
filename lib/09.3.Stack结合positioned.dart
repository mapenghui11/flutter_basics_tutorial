import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Best Spy'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

// 使用Stack结合positioned实现一个可滑动的ListView堆叠一个固定位置的二级导航栏
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取屏幕的高度和宽度
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ListView(
          // 使用padding组件让二级导航栏不会盖住ListView
          padding: const EdgeInsets.only(top: 66),
          children: const [
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
            ListTile(title: Text('Welcome to BeatSpy')),
          ],
        ),
        Positioned(
            left: 0,
            top: 0,
            // 调用size方法指定子元素的宽度，不能使用double.infinity
            width: size.width,
            height: 66,
            child: Container(
              alignment: Alignment.center,
              color: Colors.blueGrey,
              child: const Text(
                'BeatSpy',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}
