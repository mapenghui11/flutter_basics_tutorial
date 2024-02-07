import 'package:flutter/material.dart';

// pageView：实现一个可以垂直滑动的页面
class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView'),
      ),
      body: PageView(
        // 设置页面按垂直方向滑动，默认是水平方向
        scrollDirection: Axis.vertical,
        children: [
          Center(
            // PageView中的每一个child就是一个页面
            child: Text(
              '第1个视频',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          // 向右滑动加载第二个页面
          Center(
            child: Text(
              '第2个视频',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Center(
            child: Text(
              '第3个视频',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Center(
              child: Text(
            '第4个视频',
            style: Theme.of(context).textTheme.headlineLarge,
          )),
          Center(
            child: Text(
              '第5个视频',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Center(
              child: Text(
            '第6个视频',
            style: Theme.of(context).textTheme.headlineLarge,
          )),
          Center(
              child: Text(
            '第7个视频',
            style: Theme.of(context).textTheme.headlineLarge,
          )),
        ],
      ),
    );
  }
}
