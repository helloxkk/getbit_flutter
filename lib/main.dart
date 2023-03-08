import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../pages/home/home_page.dart';
import 'pages/services/service_page.dart';
import 'pages/moments/timeline_page.dart';
import 'pages/me/my_page.dart';
import 'pages/moments/post_moment_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AutomaticKeepAliveClientMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime _lastBackPressed; // 保存上次按下返回键的时间
  int _currentIndex = 0;

  final List<Widget> _children = [HomePage(), ServicesPage(), MomentsPage(), MyPage(),];
  final List<String> titles = ["首页", "服务", "动态", "我的"];
  final List<String> normalImgUrls = ["assets/images/menu_home.png", "assets/images/menu_service.png", "assets/images/menu_dynamic.png", "assets/images/menu_mine.png"];
  final List<String> selectedImgUrls = ["assets/images/menu_home_p.png", "assets/images/menu_service_p.png", "assets/images/menu_dynamic_p.png", "assets/images/menu_mine_p.png"];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    double itemWidth = MediaQuery.of(context).size.width / 5;

    return WillPopScope(
      key: UniqueKey(), // 使用 UniqueKey() 或其他不重复的 key
      onWillPop: _onBackPressed,
      child: MaterialApp(
        key: UniqueKey(), // 使用 UniqueKey() 或其他不重复的 key
        title: '村晓',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: Scaffold(
          key: _scaffoldKey,
          body: Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                settings: settings,
                builder: (context) => Scaffold(
                  body: _children[_currentIndex],
                  // floatingActionButton: FloatingActionButton(
                  //   onPressed: () => _onAddButtonPressed(context),
                  //   tooltip: 'Add',
                  //   child: Icon(Icons.add),
                  //   elevation: 2.0,
                  // ),
                  // floatingActionButtonLocation:
                  //     FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: BottomAppBar(
                    height: 68,
                    color: Colors.white,
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 4.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(height: 49, width: itemWidth, child: bottomAppBarItem(0)),
                        SizedBox(height: 49, width: itemWidth, child: bottomAppBarItem(1)),
                        // SizedBox(height: 49, width: itemWidth),
                        SizedBox(height: 49, width: itemWidth, child: bottomAppBarItem(2)),
                        SizedBox(height: 49, width: itemWidth, child: bottomAppBarItem(3))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // 加号按钮点击事件
  void _onAddButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => PostMomentPage(),
      ),
    );
  }

  Widget bottomAppBarItem(int index) {
    //设置默认未选中的状态
    TextStyle style = TextStyle(fontSize: 12, color: Colors.black);
    String imgUrl = normalImgUrls[index];
    if (_currentIndex == index) {
      //选中的话
      style = const TextStyle(fontSize: 13, color: Color.fromRGBO(64,150,105,100));
      imgUrl = selectedImgUrls[index];
    }
    //构造返回的Widget
    Widget item = Container(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(imgUrl, width: 24, height: 24),
            Text(
              titles[index],
              style: style,
            )
          ],
        ),
        onTap: () {
          if (_currentIndex != index) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
    return item;
  }

  // 返回按钮的点击事件处理
  Future<bool> _onBackPressed() async {
    if (_lastBackPressed == null ||
        DateTime.now().difference(_lastBackPressed) > Duration(seconds: 2)) {
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

  @override
  bool get wantKeepAlive => true;
}
