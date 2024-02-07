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


// 使用map循环遍历数据来构建卡片列表
class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  // ignore: unused_element
  List<Widget> _initCardData() {
    var tempList = listData.map((value) {
      return Card(
          color: const Color.fromARGB(255, 197, 171, 212),
          margin: const EdgeInsets.all(10),
          elevation: 10,
          child: Column(children: [
            AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(value['ImageUrl'],
                    fit: BoxFit.cover)),
            ListTile(
                // ClipOval方法实现头像等圆形图片
                leading: ClipOval(
                  child: Image.network(value['ImageUrl'],
                      fit: BoxFit.cover, height: 60, width: 60),
                ),
                title: Text(value['title']),
                subtitle: Text(value['text']))
          ]));
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // 也可以直接在这里进行循环遍历
      children: _initCardData(),
    );
  }
}
