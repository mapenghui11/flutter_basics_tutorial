import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Best Spy'),
          // 设置背景颜色：获取当前上下文中应用程序主题的主要颜色。
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // SizedBox和 Container类似，功能比Container简单一些
    return SizedBox(
        // ListView中水平列表的height高度是自适应的不能修改，但是可以在ListView外面设置高度
        height: 420,
        child: ListView(
            // 设置水平列表
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              // 子元素中嵌套一个Container
              Container(
                  width: 340,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Image.network(
                          'https://i.seadn.io/s/raw/files/46b0f4f92782fe9c9a609e909a98764a.png?auto=format&dpr=1&w=1000'),
                      const Text(
                        'Anonthology',
                        style: TextStyle(
                            color: Color.fromARGB(255, 239, 158, 185),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ),
                Container(
                  width: 340,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Image.network(
                          'https://i.seadn.io/s/raw/files/9573b5e8337876376602f8f2f57190a7.png?auto=format&dpr=1&w=1000'),
                      const Text(
                        'EigenLayer World Builders',
                        style: TextStyle(
                            color: Color.fromARGB(255, 239, 158, 185),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ),
                Container(
                  width: 340,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Image.network(
                          'https://metadata.y00ts.com/y/9528.png'),
                      const Text(
                        'y00ts',
                        style: TextStyle(
                            color: Color.fromARGB(255, 239, 158, 185),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ),
                Container(
                  width: 340,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Image.network(
                          'https://images.blur.io/_blur-prod/0x524cab2ec69124574082676e6f654a18df49a048/46-b16b3047b2abc1dd?w=1024'),
                      const Text(
                        'LilPudgys',
                        style: TextStyle(
                            color: Color.fromARGB(255, 239, 158, 185),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ),
                Container(
                  width: 340,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Image.network(
                          'https://images.blur.io/_blur-prod/0x4481507cc228fa19d203bd42110d679571f7912e/1387-26a9fb53668d0e10?w=512'),
                      const Text(
                        'Neo Tokyo Outer Citizens',
                        style: TextStyle(
                            color: Color.fromARGB(255, 239, 158, 185),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                )
              ]
            ));
  }
}
