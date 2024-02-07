import 'package:flutter/material.dart';

/* Wrap组件：Wrap可以实现流布局，单行的Wrap跟Row表现几乎一致，单列的Wrap则跟Row表现几乎一致。
        但Row与Column都是单行单列的，Wrap则突破了这个限制，mainAxis上空间不足时，则向crossAxis上去扩展显示。

        属性                    说明
  1. direction            主轴的方向，默认水平

  2. alignment            主轴的对齐方式

  3. spacing              主轴方向上的间距

  4. textDirection        文本方向

  5. verticalDirection    定义了children摆放顺序，默认是down

  6. runAlignment         run的对齐方式，run可以理解为新的行或者列，如果是水平方向布局的话run可以理解为新的一行

  7. runSpacing           run的间距



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
    // return Button('first', onPressed: () {},);
    // 使用wrap组件排列按钮，如果第一行放不下的时候会向第二行扩展
    return Padding(
        // 设置外间距
        padding: const EdgeInsets.all(10),
        child: Wrap(
          // 设置按钮的水平间距
          spacing: 15,
          // 设置按钮的垂直间距
          runSpacing: 5,
          // 设置按钮水平排列
          direction: Axis.horizontal,
          // 设置按钮的对齐方式，默认是居左对齐
          alignment: WrapAlignment.start,
          children: [
            // 调用Button，传入参数
            Button(
              'python',
              onPressed: () {},
            ),
            Button(
              'java',
              onPressed: () {},
            ),
            Button(
              'PHP',
              onPressed: () {},
            ),
            Button(
              'go',
              onPressed: () {},
            ),
            Button(
              'solidity',
              onPressed: () {},
            ),
            Button(
              'dart',
              onPressed: () {},
            ),
            Button(
              'c++',
              onPressed: () {},
            ),
            Button(
              'Swift',
              onPressed: () {},
            ),
            Button(
              'JavaScript',
              onPressed: () {},
            ),
          ],
        ));
  }
}

// 自定义一个可传入参数的按钮组件
// ignore: must_be_immutable
class Button extends StatelessWidget {
  // 按钮文字
  String text;
  // 点击按钮触发的方法
  void Function()? onPressed;
  // 构造函数
  Button(this.text, {Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 按照传入的参数返回按钮
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
