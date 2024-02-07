/*  container容器组件：

主要属性：
1. alignment:   topCenter:顶部居中对齐
                topLeft:顶部左对齐
                topRight:顶部右对齐
                center: 水平垂直居中对齐
                centerLeft:垂直居中水平居左对齐
                centerRight:垂直居中水平居右对齐
                bottomCenter:底部居中对齐
                botterLeft:底部居右对齐
                botterRight:底部居右对齐

2. decoration:    borderRadius:圆角
                  LinearGradient:背景线性渐变
                  RadialGradient:径向渐变

3. margin:  Container与外部其他组件的距离

4. padding:  Container的内边距，Container边缘与Child之间的距离

5. transform: 让Container容器进行位移、旋转、缩放

6. height：容器高度

7. width：容器宽度

8. child：容器子元素  

*/

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(title: const Text('Welcome to Beat Spy')),
        // 使用Column()调用多个组件
        body: const Column(children: [MyApp(), MyBotten(), MyText()])),
  ));
}

// ======定义一个容器
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Container不是const常量构造函数
    return Center(
      child: Container(
        // ===设置容器Container的属性
        alignment: Alignment.center, // 设置容器（按钮）内容居中

        width: 250,
        height: 250,

        margin: const EdgeInsets.fromLTRB(0, 120, 0, 0), // 设置容器外部边距

        // transform: Matrix4.rotationZ(0.6),              // 按照z轴旋转 0.6
        // transform: Matrix4.translationValues(0, 0, 0),  // 按照xyz轴进行位移
        transform: Matrix4.skewY(3.1), // 按照y轴进行翻转 3

        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 33, 150, 243), // 设置容器背景颜色
            border: Border.all(
                // 设置容器边框
                color: Colors.black,
                width: 8),
            borderRadius: BorderRadius.circular(30), // 设置容器圆角
            boxShadow: const [
              // 设置容器投影，List类型
              BoxShadow(
                  // 投影颜色，255表示透明度，范围0-255
                  color: Color.fromARGB(255, 132, 198, 251),
                  // 投影模糊值
                  blurRadius: 0,
                  // 投影位置
                  offset: Offset(18, 18),
                  // 投影扩散程度
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                // 设置容器背景线性渐变
                colors: [
                  // 渐变颜色
                  Color.fromARGB(255, 33, 150, 243),
                  Color.fromARGB(255, 122, 156, 236)
                ],
                // 开始渐变和结束渐变的位置
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),

        // ===容器子元素：文本
        child: const Text('0xMaph',
            style: TextStyle(color: Color(0xFFC5DCF5), fontSize: 50)),
      ),
    );
  }
}

// ======定义一个按钮组件
class MyBotten extends StatelessWidget {
  const MyBotten({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      width: 120,
      height: 80,

      transform: Matrix4.skewY(3.1),

      // margin: const EdgeInsets.all(40),  四边边距相等

      // 四边单独设置和其他外部组件的边距
      margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),

      // 设置按钮边缘和按钮内容的边距,也可以使用alignment属性
      // padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),

      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 33, 150, 243),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              // 设置容器边框
              color: Colors.black,
              width: 5),
          boxShadow: const [
            // 设置容器投影，List类型
            BoxShadow(
                color: Color.fromARGB(255, 132, 198, 251),
                blurRadius: 0,
                offset: Offset(10, 10),
                spreadRadius: 2)
          ],
          gradient: const LinearGradient(
              // 设置容器背景线性渐变
              colors: [
                // 渐变颜色
                Color.fromARGB(255, 33, 150, 243),
                Color.fromARGB(255, 122, 156, 236)
              ],
              // 开始渐变和结束渐变的位置
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),

      child: const Text(
        'Esc',
        style:
            TextStyle(color: Color.fromARGB(255, 181, 217, 247), fontSize: 40),
      ),
    );
  }
}

/* Text组件：


  1. textAlign: 文本对齐方式，center居中，left左对齐，right右对齐，justfy两端对齐

  2. textDirection: 文本方向，ltr从左至右，rtl从右至左

  3. overflow: 文字超出屏幕之后的处理方式，clip裁剪，fade渐隐，ellipsis省略号

  4. textScaleFactor: 字体显示倍率

  5. maxLines: 文字显示最大行数

  6. style: 字体的样式设置    
  
    decoration 文字装饰线 (none没有线，lineThrough删除线，overline上划线，underline下划线)

    decorationColor 文字装饰线颜色

    decorationStyle 文字装饰线风格 ([dashed,dotted]虚线，double两根线，solid一根实线，wavy波浪线)

    wordSpacing 单词间隙 (如果是负值，会让单词变得更紧凑)

    letterSpacing 字母间隙 (如果是负值，会让字母变得更紧凑)

    fontStyle 文字样式 (italic斜体，normal正常体)

    fontSize 文字大小

    color 文字颜色

    fontWeight 字体粗细 (bold粗体，normal正常体)

*/


// ======定义一个Text类
class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

        width: 400,
        height: 160,

        decoration: const BoxDecoration(
          color: Color.fromARGB(60, 33, 150, 243)
        ),

        child: const Text(
          'Beat Spy Beat Spy Beat Spy Beat Spy Beat Spy Beat Spy Beat Spy', 
          // 文字居中
          textAlign: TextAlign.center,
          // 文字超出屏幕之后clip裁剪
          overflow: TextOverflow.clip,
          // 文字显示最多5行数
          maxLines: 5,
          // 文字样式
          style: TextStyle(
            color: Colors.white,
            fontSize: 42,
            // 加粗
            fontWeight: FontWeight.w500,
            // 字体：斜体
            fontStyle: FontStyle.italic,
            // 字母间距
            letterSpacing: 1,
            // 下划线的颜色、样式
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
            decorationStyle: TextDecorationStyle.dashed
          ),
        )
      );
  }
}
