import 'package:flutter/material.dart';
// 引入要跳转的页面
import '../search.dart';
import '../form.dart';
import '../news.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                // 跳转普通路由
                //  Navigator.of方法：跳转到Search页面
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const SearchPage();
                }));
              },
              child: const Text('搜索')),
          const SizedBox(height: 40,), 
          ElevatedButton(onPressed:  () {
                //  Navigator.of方法：跳转到Form页面
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const FormPage();
                }));
              }  , child: const Text('表单')),
          const SizedBox(height: 40,),
          // 新闻按钮实现跳转传值，具体查看news.dart
          ElevatedButton(onPressed:  () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const NewsPage(title: '我是新闻标题',);
                }));
              }  , child: const Text('新闻跳转传值')),
        ],
      ),
    );
  }
}
