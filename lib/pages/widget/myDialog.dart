import 'package:flutter/material.dart';

class myDialog extends Dialog {
  // 设置弹窗标题和文字在外部传入，并在外部监听点击事件onTab
  final String title;
  final String content;
  // 可空的function类型
  final Function()? onTab;
  const myDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.onTab});
  @override
  Widget build(BuildContext context) {
    // 可以使用任意组件，Material有暗弹窗背景属性，建议使用Material
    return Material(
      // 设置暗弹窗背景
      type: MaterialType.transparency,
      // 包裹一个组件，不然会导致弹窗全屏显示
      child: Center(
        child: Container(
            height: 250,
            width: 250,
            color: const Color.fromARGB(255, 200, 159, 231),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(children: [
                    Align(alignment: Alignment.centerLeft, child: Text(title)),
                    Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: onTab,
                          child: const Icon(Icons.close),
                        ))
                  ]),
                ),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 250,
                  child: Text(content),
                )
              ],
            )),
      ),
    );
  }
}
