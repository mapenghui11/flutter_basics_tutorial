import 'package:flutter/material.dart';
import './MyIconsFont.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Best Spy'),
          // 设置背景颜色：获取当前上下文中应用程序主题的主要颜色。
          backgroundColor:Theme.of(context).primaryColor,
        ),
      body: const MyHomePage(),
      ),
    );
  }
}


/*  ===Icons组件：flutter的内置图标

Material Design 所有图标可以在其官网查看：http://material.io/tools/icons/

*/


/*  ===在Flutter中使用阿里巴巴图标库(iconfont.cn)自定义字体图标


  1. 选择自己需要的图标打包下载代码后，会生成一些不同格式的字体文件，在Flutter中，使用ttf格式。

  2. 假设我们项目中需要使用一个书籍图标和微信图标，打包下载解压后:
  
    1.在项目根目录新建一个fonts文件夹，将下载的json源文件和ttf图标文件复制到文件夹

    2. 配置pubspec.yaml文件，找到fonts进行修改：  
      // 可以添加多个自定义图标
      fonts:
      - family: MyIcons    # 指定一个字体名
        fonts:
          - asset: fonts/iconfont01.ttf   # 配置字体目录
    
    3. 在lib文件夹下新建一个文件，定义一个MyIconsFonts类，将所有图标都定义成静态变量
      import 'package:flutter/material.dart';

      class MyIconsFont {

          // 0xf0106中f0106就是json源文件中的unicode，fontFamily表示传入字体名
          static const IconData wechat =
              IconData(0xf0106, fontFamily: 'MyIcons', matchTextDirection: true);

          static const IconData emali =
              IconData(0xe604, fontFamily: 'MyIcons', matchTextDirection: true);
    
    4. 在项目文件中导入MyIconsFont类，然后进行调用
      import './MyIconsFont.dart';

      Icon(MyIconsFont.wechat, size: 40, color: Colors.green,),
      SizedBox(height: 20,),
      Icon(MyIconsFont.emali, size: 40, color: Colors.green,),

}

*/ 


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        // 设置间距
        SizedBox(height: 40,),
        // 设置flutter内置图标的大小、颜色
        Icon(Icons.home, size: 40, color: Colors.purple,),
        SizedBox(height: 20,),
        Icon(Icons.settings, size: 40, color: Colors.purple,),
        SizedBox(height: 20,),
        Icon(Icons.search, size: 40, color: Colors.purple,),
        SizedBox(height: 20,),
        Icon(Icons.person, size: 40, color: Colors.purple,),
        SizedBox(height: 20,),
        Icon(Icons.category, size: 40, color: Colors.purple,),
        SizedBox(height: 40,),
        Icon(Icons.sync, size: 40, color: Colors.purple,),
        SizedBox(height: 40,),
        Icon(Icons.done_all, size: 40, color: Colors.purple,),
        SizedBox(height: 40,),
        Icon(Icons.favorite, size: 40, color: Colors.purple,),
        // 使用自定义图标
        SizedBox(height: 20,),
        Icon(MyIconsFont.wechat, size: 40, color: Colors.purple,),
        SizedBox(height: 20,),
        Icon(MyIconsFont.emali, size: 40, color:Colors.purple,),
      ],
    );
  }
}
