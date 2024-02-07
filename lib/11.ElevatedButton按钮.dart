import 'package:flutter/material.dart';

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
        body: const LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 突起按钮，onPressed: () {}点击按钮触发的方法
            ElevatedButton(onPressed: () {}, child: const Text('Start Game')),
            // 文本按钮
            TextButton(onPressed: () {}, child: const Text('Start')),
            // 边框按钮
            const OutlinedButton(onPressed: null, child: Text('End')),
            // 图标按钮
            IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up))
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 带图标的突起按钮
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text('send')),
            // 带图标的文本按钮
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info),
                label: const Text('message')),
            // 带图标的边框按钮
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('add')),
          ],
        ),
        const SizedBox(height: 20),
        // ==== 设置按钮样式
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    // 按钮背景颜色
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    // 按钮文字图标颜色
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                child: const Text('Start Game'))
          ],
        ),
        const SizedBox(height: 20),
        // ==== 设置按钮的高宽
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 50,
              width: 140,
              child: ElevatedButton(
                // 如果onPressed: null，那就是不可点击的灰色按钮
                onPressed: null,
                child: Text('FUCK'),
              ),
            ),
            SizedBox(
              height: 40,
              width: 120,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                icon: const Icon(Icons.search),
                label: const Text('search'),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        // ==== 使用Expanded组件的flex功能对按钮进行水平铺满屏幕的自适应
        Row(
          children: [
            Expanded(
              flex: 1,
              // 如果不止要给容器设置高和宽，就要使用Container
              child: Container(
                // 设置按钮的外边距
                margin: const EdgeInsets.all(10),
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        // ==== 设置按钮圆角和实现圆形按钮
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 圆角按钮
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)))),
                onPressed: () {},
                child: const Text('shape')),
            // 圆形按钮
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder(
                        // 设置按钮边框颜色
                        side: BorderSide(color: Colors.black12)))),
                onPressed: () {},
                child: const Text('a')),
            // 给圆形按钮设置大小，嵌套一个SizedBox
            SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(const CircleBorder(
                            // 设置按钮边框颜色和边框宽度
                            side:
                                BorderSide(width: 2, color: Colors.purple)))),
                    onPressed: () {},
                    child: const Text('A')))
          ],
        ),
        const SizedBox(height: 20),
        // ==== 设置边框按钮的边框样式
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                style: const ButtonStyle(
                    side: MaterialStatePropertyAll(
                      // 设置边框颜色和宽度
                        BorderSide(width: 1, color: Colors.purple))),
                onPressed: () {},
                child: const Text('button'))
          ],
        )
      ],
    );
  }
}
