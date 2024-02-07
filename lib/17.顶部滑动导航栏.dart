import 'package:flutter/material.dart';

/* AppBar自定义顶部按钮
属性
  1. leading           在标题前面显示的一个控件，在首页通常显示应用的 logo; 在其他界面通常显示为返回按钮
  2. title             标题，通常显示为当前界面的标题文字，可以放组件
  3. actions           通常使用IconButton 来表示，可以放按钮组
  4. backgroundColor   导航背景颜色
  5. iconTheme         图标样式
  6. centerTitle       标题是否居中显示
  7. bottom            通常放tabBar，标题下面显示一个 Tab 导航栏

  bottom的Tab属性：

    tabs                    显示的标签内容，一般使用Tab对象,也可以是其他的Widget
    controller             TabController对象
    isScrollable            是否可滚动
    indicatorColor          指示器颜色
    indicatorWeight         指示器宽度
    indicatorPadding      底部指示器的Padding
    indicator             指示器decoration，例如边框等
    indicatorSize           指示器大小计算方式，TabBarlndicatorSize.label跟文字等宽TabBarlndicatorSize.tab跟每个tab等宽
    labelColor              选中label颜色
    labelStyle              选中label的Style
    labelPadding          每个label的padding值
    unselectedLabelColor  未选中label颜色
    unselectedLabelStyle  未选中label的Style

*/


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutterdemo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

// 实现顶部滑动导航栏

/*  步骤：
  1. 混入SingleTickerProviderStateMixin

  2. 定义TabController

  3. 配置TabBar和TabBarView

*/
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 生命周期函数：当组件初始化的时候就会触发，用于给_tabController进行赋值
  @override
  void initState() {
    super.initState();
    // 指定顶部导航栏的长度，即有多少个选项卡
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 配置左侧的按钮图标
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: const Text('Welcome to BS'),
          backgroundColor: const Color.fromARGB(255, 159, 133, 177),
          // 配置右侧的按钮图标
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
          ],
          // 配置TabBar选项卡
          bottom: TabBar(
            // 设置可滑动的选项卡，在选项卡在一行放不下的时候使用
            // isScrollable: true,

            // 设置指示器的颜色
            // indicatorColor: Color.fromARGB(255, 122, 63, 161),

            // 设置指示器的宽度
            indicatorWeight: 2,

            // 设置指示器的间距
            indicatorPadding: const EdgeInsets.all(5),

            // 设置指示器的长度，tab是和选项卡等长，label是和选项文字等长
            indicatorSize: TabBarIndicatorSize.tab,

            // 设置选项卡背景颜色
            indicator: BoxDecoration(
              color: const Color.fromARGB(255, 135, 102, 149),
              borderRadius: BorderRadius.circular(20)
            ),

            // 设置选中选项卡文字的颜色
            labelColor: Colors.white,

            // 设置未选中选项卡文字的颜色
            unselectedLabelColor: const Color.fromARGB(255, 180, 180, 180),

            // 设置选中选项卡文字的样式
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),

            // 设置未选中选项卡文字的样式
            unselectedLabelStyle: const TextStyle(
              fontSize: 14
            ),

            controller: _tabController,
            tabs: const [
            Tab(child: Text('关注')),
            Tab(child: Text('热门')),
            Tab(child: Text('推荐')),
          ]),
        ),
        // 配置TabBar选项卡的内容TabBarView
        body: TabBarView(
          controller: _tabController,
          children: [
          // 可以是任意组件 
          ListView(
            children: const [
              ListTile(
                title: Text('关注列表'),
              )
            ],
          ),
          ListView(
            children: const [
              ListTile(
                title: Text('热门列表'),
              )
            ],
          ),
          ListView(
            children: const [
              ListTile(
                title: Text('视频1')),
              ListTile(
                title: Text('视频2')),
              ListTile(
                title: Text('视频3')),
              ListTile(
                title: Text('视频4')),
            ],
          )
        ],));
  }
}
