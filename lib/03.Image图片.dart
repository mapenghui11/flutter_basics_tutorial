/*  flutter中，可以通过Image来加载并显示图片，
    Image的数据源可以是asset、文件、内存以及网络

    Image.asset  本地图片
    Image.network   远程图片

    Image组件的常用属性：

*/

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(title: const Text('Welcome to Best Spy')),
        body: const Column(
          children: [
            MyApp(),
            // 一个占用20高度的块，用以分隔MyApp()和Circular()组件
            SizedBox(height: 20,),
            Circular(),
            SizedBox(height: 20,),
            LocalImage(),
            SizedBox(height: 20,),
            ClipImage()
          ],
    )),
  ));
}


/*  Image的常用属性：


alignment：Alignment 图片的对齐方式

color和colorBlendMode：设置图片的背景颜色，通常和colorBlendMode配合一起使用，这样可以是图片颜色和背景色混合。

fit：BoxFit  fit属性用来控制图片的拉伸和挤压，这都是根据父容器来的。 
    BoxFit.fill:全图显示，图片会被拉伸，并充满父容器.
    BoxFit.contain:全图显示，显示原比例，可能会有空隙。
    BoxFit.cover: 显示可能拉伸，可能裁切，充满(图片充满整个容器，且不变形)。 
    BoxFit.fitWidth: 宽度满 (横向充满) ，显示可能拉伸，可能裁切。 
    BoxFit.fitHeight :高度充满 (竖向充满),显示可能拉伸，可能裁切。
    BoxFit.scaleDown: 效果和contain差不多，但此属性不允许显示超过原图大小，可小不可大。

repeat：平铺   ImageRepeat.repeat: 横向和纵向都进行重复，直到铺满整个画布。
              ImageRepeat.repeatx: 横向重复，纵向不重复。
              ImageRepeat.repeatY: 纵向重复，横向不重复。

width：宽度  一般结合ClipOval才能看到效果

height： 高度  一般结合Clip Oval才能看到效果

*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.black, 
        ),
        child: Image.network(
          'https://images.blur.io/_blur-prod/0xfd1b0b0dfa524e1fd42e7d51155a663c581bbd50/14048-f4594d08db1844cb?w=512',
          alignment: Alignment.center,
          // scale:4,                   // 缩放4倍

          // BoxFit是一个枚举类型
          // fit: BoxFit.fill,          // 拉伸填充容器
          // fit: BoxFit.contain,        // 默认原图显示
          // fit: BoxFit.fitWidth,      // 宽度充满
          // fit: BoxFit.fitHeight,     // 宽度充满
          // fit: BoxFit.cover,         // 剪裁填充容器

          // repeat: ImageRepeat.repeatX,       // 沿x轴平铺
          // repeat: ImageRepeat.repeat         // 沿x、y轴平铺
        )
      )
    );
  }
}


// 实现一个圆角图片
class Circular extends StatelessWidget {
  const Circular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.blur.io/_blur-prod/0xfd1b0b0dfa524e1fd42e7d51155a663c581bbd50/14048-f4594d08db1844cb?w=512'
          ),
        fit: BoxFit.cover
        )
      ),
    );
  }
}


// ClipOval组件实现圆形图片
class ClipImage extends StatelessWidget {
  const ClipImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child:Image.network(
        'https://images.blur.io/_blur-prod/0xfd1b0b0dfa524e1fd42e7d51155a663c581bbd50/14048-f4594d08db1844cb?w=512',
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      )
    );
  }
}



/* 加载本地图片：

1. 项目根目录新建images文件夹，images中新建2.0x，3.0x对应的文件

2. 在pubspec.yaml文件的 assets:中配置图片：
    assets:
      - images/nft.webp
      - images/2.0x/nft.webp
      - images/3.0x/nft.webp

*/

class LocalImage extends StatelessWidget {
  const LocalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      // 访问本地图片时不需要加上2.0x 3.0x的文件夹名
      child: Image.asset('images/nft.webp',),
    );
  }
}