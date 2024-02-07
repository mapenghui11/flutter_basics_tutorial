// hero组件:实现路由切换时飞入飞出的效果

/*
  photo_view : 第三方插件，实现单张或多张图片的预览，左右滑动和放大缩小

  单张图片的预览：
  import 'package:photo_view/photo_view.dart';

   Container(
    child: Photoview(imageProvider: AssetImage("assets/large-image.jpg")

  多张图片的预览
  import 'package :photo_view/photo_view_gallery.dart';

  PhotoViewGallery.builder(
    itemCount: 5,
    builder:((context, index) { 
      return  PhotoViewGalleryPageOptions(imageProvider: NetworkImage(listData[index]["imageur1"])) ;
  }))

      属性
    scrollPhysics         BouncingScrollPhysics() 滑动到边界的时候有弹跳的效果
    scrollDirection       Axis.horizontal水平方向、Axis.vertical垂直方向
    backgroundDecoration  背景颜色
    builder               builder函数根据配置的itemCount渲染函数
    itemCount             数量
    pageController         PageController(initialPage: 1) 配置初始化图片
    onPageChanged          onPageChanged触发的方法

*/