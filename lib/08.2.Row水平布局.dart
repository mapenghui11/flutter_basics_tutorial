import 'package:flutter/material.dart';

/*  Row水平布局组件（Column垂直布局组件）：

  1. mainAxisAlignment    主轴的排序方式
  2. crossAxisAlignment   次轴的排序方式
  3. children             组件子元素

*/


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Best Spy'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: const MyHomePage(),
      ),
    );
  }
}


// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // 调用传入IconContainer方法，传入图标和背景颜色
//     return IconContainer(Icons.home, color: Colors.blue);
//   }
// }

// ====Row组件布局
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         IconContainer(Icons.home, color: Colors.blue),
//         IconContainer(Icons.radar, color: const Color.fromARGB(255, 76, 166, 240)),
//         IconContainer(Icons.safety_check, color: const Color.fromARGB(255, 93, 177, 245))
//       ],
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // width: double.infinity,     表示宽度无穷大
//       width: 400,
//       height: 1200,
//       color: const Color.fromARGB(31, 27, 170, 65),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,    // 主轴spaceBetween显示
//         crossAxisAlignment: CrossAxisAlignment.center,        // 次轴在外部容器中居中
//         children: [
//           IconContainer(Icons.home, color: Colors.blue),
//           IconContainer(Icons.radar,
//               color: const Color.fromARGB(255, 76, 166, 240)),
//           IconContainer(Icons.safety_check,
//               color: const Color.fromARGB(255, 93, 177, 245))
//         ],
//       )
//     );
//   }
// }


// ====Column组件布局
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,     表示宽度无穷大
      width: 400,
      height: 1200,
      color: const Color.fromARGB(31, 27, 170, 65),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,    // 主轴spaceBetween显示
        crossAxisAlignment: CrossAxisAlignment.start,        // 次轴在外部容器中居左
        children: [
          IconContainer(Icons.home, color: Colors.blue),
          IconContainer(Icons.radar,
              color: const Color.fromARGB(255, 76, 166, 240)),
          IconContainer(Icons.safety_check,
              color: const Color.fromARGB(255, 93, 177, 245))
        ],
      )
    );
  }
}


// 通过命名参数实现调用IconContainer时可以传入不同的背景颜色和图标
// ignore: must_be_immutable
class IconContainer extends StatelessWidget {
  Color color;
  IconData icon;
  // 将color定义成命名参数，required关键词表示一定要传入的参数
  // icon不能定义成命名参数，所以在前面传入
  IconContainer(this.icon, {Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 120,
        width: 120,
        color: color,
        child: Icon(icon, color: Colors.purple, size: 28));
  }
}
