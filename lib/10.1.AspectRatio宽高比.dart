import 'package:flutter/material.dart';

/* AspectRatio：设置调整子元素child的宽高比

  1. AspectRatio首先会在布局限制条件允许的范围内尽可能的扩展

  2. widget的高度是由宽度和比率决定的，会按照固定比率去尽量占满区域。

  3. 如果在满足所有限制条件过后无法找到一个可行的尺寸，AspectRatio会优先适应布局限制条件，而忽略所设置的比率。

属性：
aspectRatio：宽高比，最终可能不会根据这个值去布局，具体则要看外层是否允许按照这种比率进行布局，只是一个参考值

*/


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
        body: const LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // 控制容器的宽高比，宽度是屏幕的宽度，高度是宽度的一般
    return AspectRatio(
      aspectRatio: 2/1,
      child: Container(
        color: Colors.blueGrey,
      ),
    );
  }
}
