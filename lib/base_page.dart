import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BasePageState();
  }

  PreferredSizeWidget buildAppBar();

  Widget buildBody(BuildContext context);
}

class _BasePageState extends State<BasePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  late DateTime _lastBackPressed; // 保存上次按下返回键的时间

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      key: _navigatorKey,
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: widget.buildAppBar(),
        body: GestureDetector(
          onTap: () {
            // 点击空白处收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: widget.buildBody(context),
        ),
      ),
    );
  }

  // 返回按钮的点击事件处理
  Future<bool> _onBackPressed() async {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      // 如果有侧滑菜单打开，则先关闭菜单
      Navigator.pop(context);
      return false;
    }

    if (DateTime.now().difference(_lastBackPressed) > Duration(seconds: 2)) {
      // 首次点击或者两次点击间隔超过2秒
      _lastBackPressed = DateTime.now();
      Fluttertoast.showToast(msg: "再按一次退出");
      return false; // 防止直接退出
    } else {
      // 两次点击间隔小于2秒，退出程序
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return true;
    }
  }
}
