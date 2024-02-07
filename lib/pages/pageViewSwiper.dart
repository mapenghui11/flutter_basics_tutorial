import 'package:flutter/material.dart';
import './widget/ImagePage.dart';

// 实现轮播图
class PageViewSwiper extends StatefulWidget {
  const PageViewSwiper({super.key});

  @override
  State<PageViewSwiper> createState() => _PageViewSwiperState();
}

class _PageViewSwiperState extends State<PageViewSwiper> {
  List<Widget> list = [];

  @override
  void initState() {
    super.initState();
    list = const [
      ImagePage(
        // width和height有默认值可以不传入
        imageUrl: 'https://metadata.y00ts.com/y/9528.png',
      ),
      ImagePage(
        imageUrl:
            'https://i.seadn.io/s/raw/files/46b0f4f92782fe9c9a609e909a98764a.png?auto=format&dpr=1&w=1000',
      ),
      ImagePage(
        imageUrl:
            'https://i.seadn.io/s/raw/files/9573b5e8337876376602f8f2f57190a7.png?auto=format&dpr=1&w=1000',
      ),
      ImagePage(
        imageUrl:
            'https://images.blur.io/_blur-prod/0x524cab2ec69124574082676e6f654a18df49a048/46-b16b3047b2abc1dd?w=1024',
      ),
      ImagePage(
        imageUrl:
            'https://images.blur.io/_blur-prod/0x4481507cc228fa19d203bd42110d679571f7912e/1387-26a9fb53668d0e10?w=512',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PageViewSwiper'),
        ),
        // PageView默认为全屏显示，通过SizedBox控制高度
        body: SizedBox(
          height: 400,
          child: PageView(children: list),
        ));
  }
}
