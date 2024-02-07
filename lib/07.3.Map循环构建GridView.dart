import 'package:flutter/material.dart';
import './listData.dart';

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

  // 使用map循环生成一个Container列表
  List<Widget> _initGridViewData() {
    var tempList = listData.map((value) {
      return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
          child: Column(
            children: [
              Image.network(value['ImageUrl']),
              const SizedBox(height: 10),
              Text(
                value['title'],
                style: const TextStyle(fontSize: 15),
              )
            ],
          ));
    });

    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    // 使用GridView.count创建网格布局
    return GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 8, // 水平子Widget间距
        mainAxisSpacing: 8, // 垂直子Widget间距
        crossAxisCount: 2,
        childAspectRatio: 0.7, // 子Widget宽高比
        children: _initGridViewData() // 在创建好的网格布局中传入Container列表
        );
  }
}
