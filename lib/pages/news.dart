import 'package:flutter/material.dart';

// 实现新闻页面接收上一个页面传过来的参数
class NewsPage extends StatefulWidget {
  final String title;
  // 默认值为‘新闻’，如果传入title的话，this.title就是传入的值
  const NewsPage({super.key, this.title = '新闻'});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  // 打印获取传入的值
  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 接受动态获取NewPage里面定义的title
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('新闻页面'),
      ),
    );
  }
}
