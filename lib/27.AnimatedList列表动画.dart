import 'dart:async';
import 'package:flutter/material.dart';


/* AnimatedList和 ListView 的功能大体相似，可以在列表中插入或删除节点时执行一个动画，
  AnimatedList是一个StatefulWidget，它对应的 State 类型为 AnimatedListState，
  添加和删除元素的方法位于 AnimatedListState 中。

AnimatedList常见属性:

  1. key globalKey final globalKey = GlobalKey();

  2. initialltemCount  子元素数量

  3. itemBuilder 方法( BuildContext context, int index, Animation animation) {}

*/


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

// 给ListTile增加或减少数据时加上动画效果
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flag = true;
  // 获取animation需要key，定义_globalKey
  // 不指定<AnimatedListState>类型的话没法调用insertItem
  final _globalKey = GlobalKey<AnimatedListState>();

  List<String> list = ['python', 'dart'];

  // 将ListTile返回新增数据封装成方法，并给ListTile数据加上删除功能
  Widget _buildItem(index) {
    return ListTile(
      title: Text(list[index]),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          // 执行删除
          _deleteItem(index);
        },
      ),
    );
  }

  // 封装删除ListTile数据的方法
  _deleteItem(index) {
    // 在删除时加入是否删除完成的判断，防止在删除完成前继续点击删除的bug
    if (flag == true) {
      flag == false;
      // 执行删除
      _globalKey.currentState!.removeItem(index, (context, animation) {
        var removeItem = _buildItem(index);
        // 数组中删除数据，先获取removeItem，再删除数据
        list.removeAt(index);
        return ScaleTransition(
            // 删除时animation的值从1到0
            scale: animation,
            // 删除的时候执行动画的元素
            child: removeItem);
      });
      Timer.periodic(const Duration(milliseconds: 500), (timer) {
        flag = true;
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              list.add('新增数据');
              // currentState可以获取AnimatedList对应的state，
              // insertItem只能在非空的时候调用，所以要加入类型断言！
              // insertItem要传入新增数据的索引值，也就是list.length-1
              _globalKey.currentState!.insertItem(list.length - 1);
            });
          }),
      // AnimatedList只有在增加或者删除list的数据的时候才会执行动画
      body: AnimatedList(
          // 获取animation需要key，将定义的_globalKey绑定给key
          key: _globalKey,
          // 初始化数量
          initialItemCount: list.length,
          itemBuilder: (context, index, animation) {
            // 返回一个淡入淡出样式的动画组件
            return FadeTransition(
              // 新增数据时animation的值从0到1
              opacity: animation,
              child: _buildItem(index),
            );
          }),
    );
  }
}
