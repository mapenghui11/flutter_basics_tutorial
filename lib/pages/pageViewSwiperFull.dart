import 'package:flutter/material.dart';
import './widget/ImagePage.dart';

// // =====实现无限加载的轮播图
// class PageViewSwiperFull extends StatefulWidget {
//   const PageViewSwiperFull({super.key});

//   @override
//   State<PageViewSwiperFull> createState() => _PageViewSwiperFullState();
// }

// class _PageViewSwiperFullState extends State<PageViewSwiperFull> {
//   List<Widget> list = [];

//   @override
//   void initState() {
//     super.initState();
//     list = const [
//       ImagePage(
//         // width和height有默认值可以不传入
//         imageUrl: 'https://metadata.y00ts.com/y/9528.png',
//       ),
//       ImagePage(
//         imageUrl:
//             'https://i.seadn.io/s/raw/files/46b0f4f92782fe9c9a609e909a98764a.png?auto=format&dpr=1&w=1000',
//       ),
//       ImagePage(
//         imageUrl:
//             'https://i.seadn.io/s/raw/files/9573b5e8337876376602f8f2f57190a7.png?auto=format&dpr=1&w=1000',
//       ),
//       ImagePage(
//         imageUrl:
//             'https://images.blur.io/_blur-prod/0x524cab2ec69124574082676e6f654a18df49a048/46-b16b3047b2abc1dd?w=1024',
//       ),
//       ImagePage(
//         imageUrl:
//             'https://images.blur.io/_blur-prod/0x4481507cc228fa19d203bd42110d679571f7912e/1387-26a9fb53668d0e10?w=512',
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('PageViewSwiper'),
//         ),
//         body: SizedBox(
//           height: 400,
//           child: PageView.builder(
//               // 实现几张图片循环滑动1000次，滑动到第1000次就没法滑动了
//               itemCount: 1000,
//               itemBuilder: (context, index) {
//                 return list[index % list.length];
//               }),
//         ));


// =====实现无限加载的轮播图，并且底部轮播导航会随着当前显示图片变亮
class PageViewSwiperFull extends StatefulWidget {
  const PageViewSwiperFull({super.key});

  @override
  State<PageViewSwiperFull> createState() => _PageViewSwiperFullState();
}

class _PageViewSwiperFullState extends State<PageViewSwiperFull> {
  List<Widget> list = [];
  int _currentIndex = 0;

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
        body: Stack(
          children: [
            SizedBox(
              height: 400,
              child: PageView.builder(
                  // 监听滑动事件
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index % list.length;
                    });
                  },
                  itemCount: 1000,
                  itemBuilder: (context, index) {
                    return list[index % list.length];
                  }),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 2,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // 给轮播图加上底部导航
                    children: List.generate(list.length, (index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            // 使用三木运算符实现底部轮播导航会随着当前显示图片变亮
                            color: _currentIndex == index?Colors.white:Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                      );
                    }).toList()))
          ],
        ));
  }
}
