import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              // 对flag进行取反
              flag = !flag;
            });
          },
        ),
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Center(
          child: Container(
              alignment: Alignment.center,
              width: 300,
              height: 300,
              color: Colors.white,
              // AnimatedSwitcher当子元素改变的时候会触发动画
              child: AnimatedSwitcher(
                // 设置动画效果
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                  // // 也可以设置动画效果的叠加
                  // return ScaleTransition(
                  //   scale: animation,
                  //   child: FadeTransition(
                  //     opacity: animation,
                  //     child: child,
                  //   ),
                  // );
                },
                duration: const Duration(seconds: 1),
                // 点击按钮前显示加载转圈，点击按钮后显示一张图片，子元素在点击按钮后改变，执行动画
                child: flag
                    ? const CircularProgressIndicator()
                    : Image.network(
                        'https://metadata.y00ts.com/y/9528.png',
                        fit: BoxFit.cover,
                      ),

                /* 注意：Text(flag?'hello world': 'hello web3')) 

                  如果使用纯文字，那么动画不会执行，
                  因为AnimatedSwitcher只有在子元素的Widget改变的时候才会执行动画，
                  当文字改变的时候Text()组件没有改变，所以动画不会执行

                  使用 UniqueKey生成唯一值，那么Text()就不是同一个组件了，动画可以执行
                  Text(Key: UniqueKey(), flag?'hello world': 'hello web3'))                      
                */
              )),
        ));
  }
}
