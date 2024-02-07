import 'package:flutter/material.dart';

/*  GridView网格布局：让可以滚动的元素使用矩阵方式排列

1、通过GridView.count实现网格布局
2、通过GridView.extent 实现网格布局
3、通过GridView.builder实现动态网格布局

GridView常用属性：
                        类型                          说明
1. scrollDirection：    Axis                       滚动方法
2. padding：            EdgelnsetsGeometry         内边距
3. resolve：            bool                        组件反向排序
4. crossAxisSpacing:    double                     水平子Widget之间间距
5. mainAxisSpacing:     double                     垂直子Widget之间间距
6. crossAxisCount:      int用在GridView.count       一行的Widget数量
7. maxCrossAxisExtent： double用在GridView.extent   横轴子元素的最大长度
8. childAspectRatio：   double                     子Widget宽高比例
9. children：                                         []
10. gridDelegate:       SliverGridDelegateWithFixedCrossAxisCount
                        SliverGridDelegateWithMaxCrossAxisExtent  控制布局主要用在GridView.builder里


*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Best Spy'),
          // 设置背景颜色：获取当前上下文中应用程序主题的主要颜色。
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: const MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // // 使用GridView.count创建网格布局
    // return GridView.count(
    //   crossAxisCount: 3,      // 一行显示的Widget数量
    //   children: const [
    //     Icon(Icons.home),
    //     Icon(Icons.dangerous),
    //     Icon(Icons.cabin),
    //     Icon(Icons.safety_check),
    //     Icon(Icons.vaccines),
    //     Icon(Icons.face),
    //     Icon(Icons.yard),
    //     Icon(Icons.wallet),
    //     Icon(Icons.padding)
    //   ]);

    // 使用GridView.extent创建网格布局
    return GridView.extent(
        maxCrossAxisExtent: 100, // 横轴子元素的最大长度
        children: const [
          Icon(Icons.home),
          Icon(Icons.dangerous),
          Icon(Icons.cabin),
          Icon(Icons.safety_check),
          Icon(Icons.vaccines),
          Icon(Icons.face),
          Icon(Icons.yard),
          Icon(Icons.wallet),
          Icon(Icons.padding)
    ]);
  }
}
