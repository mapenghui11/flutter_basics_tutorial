import 'package:flutter/material.dart';
import './ListData.dart';

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

// 定义一个动态列表
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // // 定义一个方法，用for循环生成List，返回的值是<widget>
  // List<Widget> _initListData() {
  //   List<Widget> tempList = [];

  //   for (var i = 0; i < listData.length; i++) {
  //     tempList.add(
  //       ListTile(
  //         leading: Image.network('${listData[i]['ImageUrl']}'),
  //         title: Text('${listData[i]['title']}'),
  //         subtitle: Text('${listData[i]['text']}'),
  //       )
  //     );
  //   }

  //   return tempList;
  // }


  // 定义一个方法，用map方法生成List
  // map方法用于迭代集合，它会将一个函数应用于集合中的每个元素，然后返回一个新的集合，value 就是当前迭代的元素
  List<Widget> _initListData() {
    var tempList = listData.map((value) {
      return ListTile(
        leading: Image.network('${value['ImageUrl']}'),
        title: Text('${value['title']}'),
        subtitle: Text('${value['text']}'),
      );
    });

    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _initListData(),
    );
  }
}
