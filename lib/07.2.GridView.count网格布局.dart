import 'package:flutter/material.dart';

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


  // 使用for循环生成一个Container列表
  List<Widget> _initGridViewData() {
    List<Widget> tempList = [];
    for (var i = 0; i < 12; i++) {
      tempList.add(Container(
          alignment: Alignment.center,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 242, 199, 250)),
          child: Text('第$i个元素', style: const TextStyle(fontSize: 20))));
    }
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    // 使用GridView.count创建网格布局
    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 8,    // 水平子Widget间距
      mainAxisSpacing: 8,     // 垂直子Widget间距
      crossAxisCount: 2, 
      childAspectRatio: 1,    // 子Widget宽高比  
      children: _initGridViewData()  // 在创建好的网格布局中传入Container列表
    );
  }
}
