import 'dart:async';
import 'package:flutter/material.dart';

class Swiper extends StatefulWidget {
  final double width;
  final double height;
  final List<String> list;
  const Swiper(
      {super.key,
      this.width = double.infinity,
      this.height = 400,
      required this.list});

  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  int _currentIndex = 0;
  List<Widget> pageList = [];
  late PageController _pageController;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.list.length; i++) {
      pageList.add(ImagePage(
          width: widget.width,
          height: widget.height,
          imageUrl: widget.list[i]));

      _pageController = PageController(initialPage: 0);

      timer = Timer.periodic(const Duration(seconds: 3), (t) {
        _pageController.animateToPage((_currentIndex + 1) % pageList.length,
            // 设置跳转时间和跳转的动画效果
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear);
      });
    }
  }

  // 页面销毁时执行的操作，取消定时器timer，销毁_pageController，不然会占用内存
  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 400,
          child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index % pageList.length;
                });
              },
              itemCount: 1000,
              itemBuilder: (context, index) {
                return pageList[index % pageList.length];
              }),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 2,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // 给轮播图加上底部导航
                children: List.generate(pageList.length, (index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        // 使用三木运算符实现底部轮播导航会随着当前显示图片变亮
                        color:
                            _currentIndex == index ? Colors.white : Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                  );
                }).toList()))
      ],
    );
  }
}

class ImagePage extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;

  const ImagePage(
      {super.key,
      this.width = double.infinity,
      this.height = 200,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
