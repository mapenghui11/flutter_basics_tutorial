import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  // 接收命名路由跳转传值
  final Map arguments;
  const ShopPage({super.key, required this.arguments});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    super.initState();
    print(widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('商店'),
        ),
        body: const Center(
          child: Text('商店页面'),
        ));
  }
}
