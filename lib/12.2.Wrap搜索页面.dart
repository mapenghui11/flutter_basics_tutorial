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
        body: const LayoutDemo(),
      ),
    );
  }
}

// 实现一个搜索页面的实例
class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(15), children: [
      Row(
        children: [
          Text('Trend', style: Theme.of(context).textTheme.titleLarge),
          // style: TextStyle(
          //   color: Color.fromARGB(255, 121, 39, 176),
          //   fontWeight: FontWeight.w600,
          //   fontSize: 24
          // )
        ],
      ),
      const Divider(),
      Wrap(spacing: 15, runSpacing: 5, children: [
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
        )
      ]),
      const SizedBox(height: 10),
      Row(
        children: [
          Text(
            'history recode',
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
      const Divider(),
      // 在ListView中不能再嵌套一个ListView，所以使用Column实现纵向布局
      const Column(
        children: [
          ListTile(title: Text('python')),
          Divider(),
          ListTile(title: Text('solidity')),
          Divider(),
          ListTile(title: Text('flitter')),
          Divider()
        ],
      ),
      const SizedBox(height: 40),
      Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
          child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              label: const Text('clean the recode')))
    ]);
  }
}

// 自定义一个可传入参数的按钮组件
// ignore: must_be_immutable
class Button extends StatelessWidget {
  // 按钮文字
  String text;
  // 点击按钮触发的方法
  void Function()? onPressed;
  Button(this.text, {Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
