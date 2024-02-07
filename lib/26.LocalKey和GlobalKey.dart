/* =====================flutter key: LocalKey、GlobalKey========================

1. 在Flutter中，Key是不能重复使用的，所以Key一般用来做唯一标识。

2. 组件在更新的时候，其状态的保存主要是通过判断组件的类型或者key值是否一致。

3. 因此，当各组件的类型不同的时候，类型已经足够用来区分不同的组件了，此时可以不必使用key，
  但是如果同时存在多个同一类型的控件的时候，此时类型已经无法作为区分的条件了，就需要使用到key。


==================Flutter key子类包含 LocalKey和GlobalKey====================

1. 局部键 (LocalKey) : ValueKey、 ObjectKey、UniqueKey
2. 全局键 (GlobalKey) : GlobalKey、GlobalObjectKey


======================GlobalKey获取子组件===============================
globalKey.currentState 可以获取子组件的状态，执行组件的方法，
globalKey.currentWidget可以获取子组件的属性，
globalKey.currentContext!.findRenderObiect()可以获取渲染的属性

onPressed: () {
  // 1、获取子组件的状态 调用子组件的属性
  var state=(_globalkey.currentstate as _Boxstate);
  setstate(() {
    state._count++;
  });

  // 2、获取子组件的属性
  var box=(_globakey.currentwidget as Box);
  print(box.color);

  // 3、获取子组件渲染的属性
  var renderBox= (
    _globalkey.currentContext!.findRenderObject() as RenderBox
      );print(renderBox.size);

*/