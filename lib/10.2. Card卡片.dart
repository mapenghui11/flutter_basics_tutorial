import 'package:flutter/material.dart';

/* Card卡片组件块：内容可以由大多数类型的Widget构成，Card具有圆角和阴影属性

属性：
  1. margin外边距

  2. child子组件

  3. elevation阴影值的深度

  4. color背景颜色

  5. shadowColor阴影颜色

  6. clipBehavior: 内容溢出的剪切方式
      Clip.none不剪切 
      Clip.hardEdge裁剪但不应用抗据齿
      Clip.antiAlias裁剪而且抗据齿
      Clip.antiAliasWithSaveLayer带有抗锯齿的剪辑，并在剪辑之后立即保存saveLayer

  6. Shape：
      Card的阴影效果，默认的阴影效果为圆角的长方形边。 
      shape: constRoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))

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

// 实现三个卡片
class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ===========================第1种卡片=================================
        const Card(
          child: Text('0xMaph'),
        ),
        // ===========================第2种卡片=================================
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20) // 设置圆角
              ),
          elevation: 8, // 设置阴影深度
          margin: const EdgeInsets.all(10), // 设置卡片上下左右的间距
          color: const Color.fromARGB(255, 181, 212, 238), // 设置背景颜色
          child: const Column(
            children: [
              ListTile(
                title: Text('0xMaph'),
                subtitle: Text('python/solidity'),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(title: Text('mapenghui11@gmail.com')),
              Divider(
                color: Colors.white,
              ),
              ListTile(title: Text('智商30')),
            ],
          ),
        ),
        // ===========================第3种卡片=================================
        const Card(
          child: Column(
            children: [
              ListTile(
                title: Text('Jackson Ma'),
                subtitle: Text('Flutter/flash/figma'),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(title: Text('jasksonma03@gmail.com')),
              Divider(
                color: Colors.white,
              ),
              ListTile(title: Text('懂点Java')),
            ],
          ),
        ),
      ],
    );
  }
}
