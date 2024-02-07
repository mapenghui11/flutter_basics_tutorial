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
        body: const MyHomePage(),
      ),
    );
  }
}


// 使用Row和Column结合Expanded实现实例：
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(width: double.infinity, height: 200, color: Colors.black),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                  height: 180,
                  child: Image.network('https://metadata.y00ts.com/y/9528.png',
                      fit: BoxFit.cover),
                )),
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 180,
                  child: Column(children: [
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: double.infinity,
                            child: Image.network(
                                'https://metadata.y00ts.com/y/9528.png',
                                fit: BoxFit.cover))),
                    const SizedBox(height: 12),
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                            width: double.infinity,
                            child: Image.network(
                                'https://metadata.y00ts.com/y/9528.png',
                                fit: BoxFit.cover))),
                  ]
                ),
              )
            )
          ],
        )
      ],
    );
  }
}
