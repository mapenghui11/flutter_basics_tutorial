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


/*  使用build方法创建一个GridView，build方法返回一个 GridView.builder，用于构建一个网格布局，
  而 _initGridViewData方法用于构建每个网格项的内容
*/


/* 1. GridView.builder 本身是一个构建列表的方式。

  2. GridView.builder 接受一个 itemBuilder 回调函数，该函数将根据列表的长度（由 itemCount 指定）构建每个列表项。

  3. itemBuilder 回调函数是 _initGridViewData。这个函数会在构建每个列表项时被调用，而 index 参数表示当前项在列表中的索引。

  4. GridView.builder 会根据 itemCount 的值调用 _initGridViewData 函数多次，每次调用都会传递不同的 index，直到构建完整的列表。
  
  5. 这种机制不需要显式使用 for 循环或 map 方法，而是让 GridView.builder 自动处理列表项的构建。

*/
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // ignore: unused_element
  Widget _initGridViewData(context, index) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
      child: Column(
        children: [
          Image.network(listData[index]['ImageUrl']),
          const SizedBox(height: 10),
          Text(
            listData[index]['title'],
            style: const TextStyle(fontSize: 15)
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 使用GridView.count创建网格布局
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: listData.length,

        // ===SliverGridDelegateWithFixedCrossAxisCount对应的另一种方法，需要传入maxCrossAxisExtent
        // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //  maxCrossAxisExtent: 220,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8, 
          childAspectRatio: 0.7,
        ), 
      itemBuilder: _initGridViewData,
    );
  }
} 