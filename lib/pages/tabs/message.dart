import 'package:flutter/material.dart';
// 命名路由跳转不需要引入页面文件
// import '../search.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 命名路由跳转
          ElevatedButton(
              onPressed: () {
                // 命名路由跳转
                Navigator.pushNamed(context, '/search');
              },
              child: const Text('搜索(命名路由跳转)')),
          const SizedBox(
            height: 60,
          ),
          // 命名路由传值
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sport',
                    arguments: {'title': '命名路由传值', 'aid': 20});
              },
              child: const Text('体育(命名路由传值)')),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/shop',
                    arguments: {'title': '命名路由传值2'});
              },
              child: const Text('商店(命名路由传值)'))
        ],
      ),
    );
  }
}  
