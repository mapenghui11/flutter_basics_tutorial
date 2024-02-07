import 'package:flutter/material.dart';
// 导入页面文件
import './tabs/home.dart';
import './tabs/category.dart';
import './tabs/setting.dart';
import './tabs/user.dart';
import './tabs/message.dart';

// ====实现一个底部导航栏，集成顶部导航栏TabBar，具体实现查看./tabs/home.dart文件
class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
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
      // 将点击导航栏的索引在数组中对应的页面加载到body中
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          // 选中的颜色
          // fixedColor: Colors.purple,

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
          backgroundColor: _currentIndex == 2?const Color.fromARGB(255, 119, 39, 176):const Color.fromARGB(255, 230, 208, 234),
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
