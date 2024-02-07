// import 'package:flutter/material.dart';
// import './pages/tab.dart';

// =====替换路由
// 如登陆页面，从第一步跳到第二步，再从第二步跳到第三步，最后返回时跳过第二步直接返回到第一步
// Navigator.of(context).pushReplacementNamed('/registerThird')  // /registerThird是第三步页面文件

// =====从第三步直接返回到根路由
// Navigator.of(context).pushAndRemoveUntil(
//  MaterialPageRoute(
//    builder: (BuildContext context) {
//      return const Tab();
//    }),
//   (routr) => false)


// =====实现一个返回到指定根页面的方法：

// 1. 将tab.dart文件修改成可传参

// class Tabs extends StatefulWidget {
//   // 指定根页面的索引值属性
//   final int index;
//   const Tabs({super.key, this.index=0});

//   @override
//   State<Tabs> createState() => _TabsState();
// }

// class _TabsState extends State<Tabs> {
//   // 初始化_currentIndex
//   late int _currentIndex;

//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = widget.index;
//   }

//   final List<Widget> _pages = const [
//     HomePage(),
//     CategoryPage(),
//     MessagePage(),
//     Setting(),
//     UserPage(),
//   ];

// 2. 调用Tabs组件就可以传入要返回根页面的索引值
// Navigator.of(context).pushAndRemoveUntil(
//  MaterialPageRoute(
//    builder: (BuildContext context) {
//      return const Tab(index: 3);
//    }),
//   (routr) => false)


// =====指定每次打开app直接定位加载到登陆页面
// 在main.dart中修改initialRoute，假设登录页面为login
// initialRoute: '/login',