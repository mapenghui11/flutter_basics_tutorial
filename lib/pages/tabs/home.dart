import 'package:flutter/material.dart';
// 导入自定义组件keepAliveWrapper
import '../../tools/keepAliveWrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    // 监听_tabController的改变事件，即获取点击或滑动页面的索引值
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print(_tabController.index);
      }
    });
  }

  // 组件销毁的时候触发
  // 在底部导航栏其他选项被选中的时候，这时候该组件的状态和缓存会被销毁
  @override
  void dispose() {
    super.dispose();
    // 销毁_tabController
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          // 设置AppBar的高度
          preferredSize: const Size.fromHeight(50),
          // 在Scaffold中嵌套一个AppBar，实现底部导航栏集成顶部AppBar的布局
          child: AppBar(
              // 设置AppBar的亮度
              elevation: 2,
              title: TabBar(
                  // onTap只能监听点击事件不能监听滑动事件
                  // onTap: (index) {},
                  isScrollable: true,
                  controller: _tabController,
                  tabs: const [
                    Tab(child: Text('关注')),
                    Tab(child: Text('热门')),
                    Tab(child: Text('视频')),
                    Tab(child: Text('新闻')),
                    Tab(child: Text('财经')),
                    Tab(child: Text('体育')),
                  ]))),
      body: TabBarView(controller: _tabController, children: [
        // 使用keepAliveWrapper组件给ListView增加缓存，即滑动到其他页面后返回ListView不会刷新该ListView
        keepAliveWrapper(
            child: ListView(
          children: const [
            ListTile(
              title: Text('关注1'),
            ),
            ListTile(
              title: Text('关注2'),
            ),
            ListTile(
              title: Text('关注3'),
            ),
            ListTile(
              title: Text('关注4'),
            ),
            ListTile(
              title: Text('关注5'),
            ),
          ],
        )),
        const Text('热门视频'),
        const Text('我的视频'),
        const Text('热点新闻'),
        const Text('金融财经'),
        const Text('体育nba'),
      ]),
    );
  }
}
