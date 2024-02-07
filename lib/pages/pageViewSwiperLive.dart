import 'package:flutter/material.dart';
import './widget/swiper.dart';

void main() {
  runApp(MyApp());
}

// 实现轮播图，以及无限加载的轮播图，并且底部轮播导航会随着当前显示图片变亮
// 具体实现查看pageViewSwiper.dart和pageViewSwiperFull.dart
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutterdemo',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        // 配置onGenerateRoute  固定写法
        // onGenerateRoute: onGenerateRoute);
        // 
    );
  }
}

// =====实现无限加载的动态轮播图
class PageViewSwiperLive extends StatefulWidget {
  const PageViewSwiperLive({super.key});

  @override
  State<PageViewSwiperLive> createState() => _PageViewSwiperLiveState();
}

class _PageViewSwiperLiveState extends State<PageViewSwiperLive> {
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    list = const [
      'https://metadata.y00ts.com/y/9528.png',
      'https://i.seadn.io/s/raw/files/46b0f4f92782fe9c9a609e909a98764a.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/9573b5e8337876376602f8f2f57190a7.png?auto=format&dpr=1&w=1000',
      'https://images.blur.io/_blur-prod/0x524cab2ec69124574082676e6f654a18df49a048/46-b16b3047b2abc1dd?w=1024',
      'https://images.blur.io/_blur-prod/0x4481507cc228fa19d203bd42110d679571f7912e/1387-26a9fb53668d0e10?w=512',
    ];
    // // 创建定时器
    // Timer.periodic(const Duration(seconds: 2), (timer) {
    //   print('执行');
    //   // 取消定时器
    //   // timer.cancel();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PageViewSwiper'),
        ),
        body: ListView(
          children: [Swiper(list: list)],
        ));
  }
}
