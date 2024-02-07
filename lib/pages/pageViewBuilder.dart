import 'package:flutter/material.dart';

// 使用PageViewBuild遍历页面
class PageViewBuilderPage extends StatefulWidget {
  const PageViewBuilderPage({super.key});

  @override
  State<PageViewBuilderPage> createState() => _PageViewBuilderPageState();
}

class _PageViewBuilderPageState extends State<PageViewBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageViewBuilder'),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
          // 从1到10遍历itemBuilder，即遍历出10个页面
          itemCount: 10,
          itemBuilder: (context, index) {
            return Center(
              // PageView中的每一个child就是一个页面
              child: Text(
                '${index + 1}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            );
          }),
    );
  }
}
