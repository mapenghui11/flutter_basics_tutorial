import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/widget/myDialog.dart';
import './dialog.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  // =====提示弹窗
  // 在showDialog外层获取值，定义成异步函数
  // void _alertDialog() async {
  //  var result = await showDialog(
  void _alertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('警告'),
            content: const Text('返回后将无法再次加入'),
            actions: [
              TextButton(
                  onPressed: () {
                    // 点击按钮执行返回
                    // pop中传入的值就是showDialog外层获取的值
                    // Navigator.of(context).pop('确定');
                    Navigator.of(context).pop();
                    // 在showDialog内层获取值
                    print('ok');
                  },
                  child: const Text('确定')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop('取消');
                  },
                  child: const Text('取消'))
            ],
          );
        });

    // 如果showDialog外层获取值，则打印出来
    // print(result);
  }

  // =====选项弹窗
  void _simpleDialog() {
    showDialog(
        // barrierDismissible设置点击弹窗外的灰色背景时弹窗是否消失
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('选择语言'),
            children: [
              const Divider(),
              SimpleDialogOption(
                onPressed: () {
                  print('chinese');
                  Navigator.of(context).pop('chinese');
                },
                child: const Text('chinese'),
              ),
              const Divider(),
              SimpleDialogOption(
                onPressed: () {
                  print('english');
                  Navigator.of(context).pop('english');
                },
                child: const Text('english'),
              ),
              const Divider(),
              SimpleDialogOption(
                onPressed: () {
                  print('japanese');
                  // 另一种返回页面的写法
                  Navigator.pop(context, 'japanese');
                },
                child: const Text('japanese'),
              ),
            ],
          );
        });
  }

  // =====底部弹窗
  void _modelBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 230,
            child: Column(children: [
              ListTile(
                title: const Text('分享'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('收藏'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('发布'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('取消'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ]),
          );
        });
  }

  // =====flutter第三方包，可以实现弹窗在固定时间后消失

  /* 在pub.dev上找到第三方插件，按照文档说明安装后，
    重新保存一次项目后再对设备进行一次连接，在项目中引入第三方插件后，
    将文档的代码复制到项目中进行修改即可
  */
  void _toast() {
    Fluttertoast.showToast(
        msg: "请先进行登录",
        // 调整提示时间，只针对安卓平台
        // toastLength: Toast.LENGTH_LONG
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        // 调整提示时间，只针对ios和Web端
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 107, 93, 158),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _myDialog() {
    showDialog(
        // 传入自定义弹窗的参数
        context: context,
        builder: (context) {
          return myDialog(
            title: '警告',
            content: '提示信息',
            onTab: () {
              Navigator.pop(context);
              print('close');
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: _alertDialog,
                child: const Text('alert弹出框-AlertDialog')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _simpleDialog,
                child: const Text('select弹出框-SimpleDialog')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _modelBottomSheet,
                child: const Text('ActionSheet底部弹出框-ModelBottomSheet')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _toast, child: const Text('Toast')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _myDialog, child: const Text('自定义dialog')),
          ],
        ),
      ),
    );
  }
}
