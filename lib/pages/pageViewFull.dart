import 'package:flutter/material.dart';

// 实现无限加载视频页面
class PageViewFillPage extends StatefulWidget {
  const PageViewFillPage({super.key});

  @override
  State<PageViewFillPage> createState() => _PageViewFillPageState();
}

class _PageViewFillPageState extends State<PageViewFillPage> {
  List<Widget> list = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      list.add(Center(
        child: Text(
          '第${i + 1}个视频',
          style: const TextStyle(fontSize: 40),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FullPage无限加载'),
      ),
      body: PageView(
        // 当页面改变的时候触发的方法，可以用于监听页面的index，在页面快要结束时继续增加数据
        onPageChanged: (index) {
          print(index);
          // 当滑到第8条视频时给list增加数据，继续加载视频数据，实现无限加载
          if (index + 2 == list.length) {
            setState(() {
              for (var i = 0; i < 10; i++) {
                list.add(Center(
                  child: Text(
                    '第${i + 1}个视频',
                    style: const TextStyle(fontSize: 40),
                  ),
                ));
              }
            });
          }
        },
        scrollDirection: Axis.vertical,
        children: list,
      ),
    );
  }
}
