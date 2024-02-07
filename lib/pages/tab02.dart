import 'package:flutter/material.dart';
// 导入页面文件
import './tabs/home.dart';
import './tabs/category.dart';
import './tabs/setting.dart';
import './tabs/user.dart';
import './tabs/message.dart';

// tab系列文件必须有main文件调用才能运行

class TabDrawer extends StatefulWidget {
  const TabDrawer({super.key});

  @override
  State<TabDrawer> createState() => _TabDrawerState();
}

class _TabDrawerState extends State<TabDrawer> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    CategoryPage(),
    MessagePage(),
    Setting(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Welcome to BeatSpy'),
          backgroundColor: Theme.of(context).primaryColor),
      // 创建一个左侧侧边栏
      // drawer: const Drawer(
      //   child: Text('左侧边栏'),
      // ),

      drawer: const Drawer(
        child: Column(
          children: [
            // 使用Row()的flex方法和fit方法实现背景图片的平铺
            Row(
              children: [
                Expanded(
                  flex: 1,
                  // // ====DrawerHeader组件
                  // // DrawerHeader是应用于侧边栏顶部的组件，DrawerHeader布局为自定义
                  // child: DrawerHeader(
                  //     // 配置背景图片
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //             image: NetworkImage(
                  //                 'https://metadata.y00ts.com/y/9528.png'),
                  //             fit: BoxFit.cover)),
                  //     child: Column(
                  //       children: [
                  //         // 加入头像和用户名
                  //         ListTile(
                  //           leading: CircleAvatar(
                  //             backgroundImage: NetworkImage(
                  //                 'https://metadata.y00ts.com/y/9528.png'),
                  //           ),
                  //           title: Text(
                  //             '0xMaph',
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.w800,
                  //                 fontSize: 18),
                  //           ),
                  //         ),
                  //       ],
                  //     )),

                  // ====UserAccountsDrawerHeader组件
                  // UserAccountsDrawerHeader组件提供了布局DrawerHeader的一些方法，就不需要自定义DrawerHeader
                  child: UserAccountsDrawerHeader(
                    // 设置用户名
                    accountName: Text('0xMaph'),
                    // 设置邮箱（副标题）
                    accountEmail: Text('mapenghui11@gmail.com'),
                    // 设置头像
                    currentAccountPicture: CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://metadata.y00ts.com/y/9528.png'),
                    ),
                    // 设置背景图
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://metadata.y00ts.com/y/9528.png'))),
                  ),
                )
              ],
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text('个人中心'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text('系统设置'),
            )
          ],
        ),
      ),
      // 创建一个右侧边栏
      endDrawer: const Drawer(
        child: Text('右侧边栏'),
      ),
      // 将点击导航栏的索引在数组中对应的页面加载到body中
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          // 当导航菜单超过四个，要设置type参数
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '用户')
          ]),
      floatingActionButton: Container(
        // 调整浮动按钮的大小
        height: 60,
        width: 60,
        // 调整浮动按钮和容器的间距
        padding: const EdgeInsets.all(4),
        // 调整浮动按钮的外边距
        margin: const EdgeInsets.only(top: 3),
        // 设置容器的颜色和圆角
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: FloatingActionButton(
          // 使用三目运算符改变浮动按钮的背景颜色，当点击该按钮时背景颜色变成紫色
          backgroundColor: _currentIndex == 2
              ? const Color.fromARGB(255, 151, 121, 172)
              : const Color.fromARGB(255, 230, 208, 234),
          child: const Icon(Icons.message),
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
        ),
      ),
      // 配置浮动按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
