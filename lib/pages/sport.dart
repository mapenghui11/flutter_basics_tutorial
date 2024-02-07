import 'package:flutter/material.dart';

class SportPage extends StatefulWidget {
  
  final Map arguments;
  const SportPage({super.key, required this.arguments});

  @override
  State<SportPage> createState() => _SportPageState();
}

class _SportPageState extends State<SportPage> {
  @override
  void initState() {
    super.initState();
    print(widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('体育'),
      ),
      body: const Center(
        child: Text('体育页面'),
      ),
    );
  }
}
