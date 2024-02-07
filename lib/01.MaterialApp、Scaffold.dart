/* flutter目录结构：

1. android：Android平台相关代码

2. lib：flutter相关代码，编写的代码存放在这个文件夹

3. test：用于存放测试代码

4. pubspec.yaml：配置文件，存放一些第三方库的依赖

5. analysis_options.yaml：分析dart语法的文件，老项目迁移至新项目有警告信息可以删掉此文件

*/

import 'package:flutter/material.dart';

// void main() {
//   // runApp: flutter自带的入口方法，在runApp中调用组件，组件其实就是一个类

//   // Center()组件：内容居中
//   // 调用Center()组件就是实例化Center类，加上const多个相同的实例会共享存储空间
//   runApp(const Center(
//     // 传入Center组件的child命名参数
//     // 传入Text组件（构造函数）的参数和属性：
//     // textDirection由TextDirection类型（类）修饰，style同理
//     child: Text('Beat Spy',
//         textDirection: TextDirection.ltr,
//         style: TextStyle(color: Colors.white, fontSize: 60.0)),
//   ));
// }

/*  使用MaterialApp和Scaffold两个组件装饰app

1. MaterialApp一般作为顶层widget使用，是所有组件的根组件
  常见属性：home主页、title标题、color颜色、theme主题、routes路由

2. Scaffold由MaterialApp的home组件包裹，主要属性：
  appBar：显示在界面顶部的appBar

  body：当前页面显示的主要内容

  drawer：抽屉菜单控件

*/

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       // appBar由AppBar类修饰，调用属性title，title是Widget类型，所以要加上Text组件
//       appBar: AppBar(title: const Text('Welcome to BeatSpy')),
//       // 将Center组件放到body中
//       body: const Center(
//         child: Text('Beat Spy',
//             textDirection: TextDirection.ltr,
//             style: TextStyle(color: Colors.black, fontSize: 60.0)),
//       ),
//     ),
//   ));
// }


/* 自定义组件：自定义组件就是一个类，这个类需要继承StatelessWidget/StatefulWidget

  1. StatelessWidget是无状态组件，状态不可变的widget

  2. StatefulWidget是有状态组件，持有的状态可能在widget生命周期改变

*/ 

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Welcome to BeatSpy')),
      // 将Center封装成自定义组件后放到body中
      body: const MyApp(),
    ),
  ));
}


// 自定义组件
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  // StatelessWidget是个抽象类，需要实现抽象方法
  @override
  Widget build(BuildContext context) {
    // 返回一个Center组件
    return const Center(
        child: Text('Beat Spy',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.blue, fontSize: 60.0)),
      );
  }
}