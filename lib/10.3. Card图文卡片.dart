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

// 实现两个图文卡片
class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          color: const Color.fromARGB(255, 197, 171, 212),
          margin: const EdgeInsets.all(10),
          elevation: 10,
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network('https://metadata.y00ts.com/y/9528.png',
                      fit: BoxFit.cover)),
              ListTile(
                // ClipOval方法实现头像等圆形图片
                leading: ClipOval(
                  child: Image.network(
                    'https://metadata.y00ts.com/y/9528.png',
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60),
                ),
                title: const Text('0xMaph'),
                subtitle: const Text('python/solidity')
              )
            ]
          )
        ),

        Card(
          color: const Color.fromARGB(255, 197, 171, 212),
          margin: const EdgeInsets.all(10),
          elevation: 10,
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network('https://i.seadn.io/s/raw/files/46b0f4f92782fe9c9a609e909a98764a.png?auto=format&dpr=1&w=1000',
                      fit: BoxFit.cover)),
              const ListTile(
                // CircleAvatar方法实现头像等圆形图片
                leading: CircleAvatar(
                  radius: 30,           // 设置圆形图片的半径
                  backgroundImage: NetworkImage('https://i.seadn.io/s/raw/files/46b0f4f92782fe9c9a609e909a98764a.png?auto=format&dpr=1&w=1000'),
                ),
                title: Text('Jackson Ma'),
                subtitle: Text('Flutter/flash/figma'),
              )
            ],
          ),
        )
      ],
    );
  }
}
