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
    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      children: <Widget>[
        ListTile(
          leading:ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child:Image.network(
              'https://i.seadn.io/s/raw/files/46b0f4f92782fe9c9a609e909a98764a.png?auto=format&dpr=1&w=1000',
              width: 55,
              height: 55,
              fit: BoxFit.cover
            )
          ),
          title: const Text(
            'Anonthology',
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w600)),
          subtitle: const Text('Anonthology is a tribute to Wojak, the immortal meme character.'),
          trailing: const Icon(Icons.chevron_right_sharp, color: Colors.purple),
        ),
        const Divider(),

        ListTile(
          leading:ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child:Image.network(
              'https://i.seadn.io/s/raw/files/9573b5e8337876376602f8f2f57190a7.png?auto=format&dpr=1&w=1000',
              width: 55,
              height: 55,
              fit: BoxFit.cover
            )
          ),
          title: const Text(
            'EigenLayer World Builders',
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w600)),
          subtitle: const Text('The Restaking Collective gathered as one, at the threshold of infinite...'),
          trailing: const Icon(Icons.chevron_right_sharp, color: Colors.purple),
        ),
        const Divider(),

        ListTile(
          leading:ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child:Image.network(
              'https://metadata.y00ts.com/y/9528.png',
              width: 55,
              height: 55,
              fit: BoxFit.cover
            )
          ),
          title: const Text(
            'y00ts',
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w600)),
          subtitle: const Text('y00topia is a curated community of builders and creators.'),
          trailing: const Icon(Icons.chevron_right_sharp, color: Colors.purple),
        ),
        const Divider(),
      ],
    );
  }
}
