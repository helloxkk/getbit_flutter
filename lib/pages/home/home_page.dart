import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_banner.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lunar/lunar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<dynamic> _dockList = [];

  @override
  initState() {
    super.initState();
    _loadDockList();
  }

  Future<void> _loadDockList() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/dock_list.json');
      setState(() {
        _dockList = json.decode(jsonString);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GestureDetector(
        onTap: () {
          // 点击空白处收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: buildBody(context),
      ),
    );
  }

  buildAppBar() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('M月d日 EEEE').format(now);
    Lunar date = Lunar.fromDate(now);
    print(date.getSolar().toFullString());
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      leading: null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // flutter 获取日期显示在Text上，日期格式为：“3月8日 周三 阴历二月十七”
              Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 11.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 1),
              Text(
                  date.toString(),
                style: const TextStyle(
                  fontSize: 10.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
      actions: [
        Container(
          width: 75,
          height: 30,
          margin: const EdgeInsets.symmetric(vertical: 13, horizontal: 0),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          decoration: BoxDecoration(
            color:  Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/search_icon.png',
                width: 17,
                height: 17,
              ),
              const SizedBox(width: 5),
              const Text(
                "搜索",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Image.asset(
            "assets/images/ic_scan.png",
            width: 30,
            height: 30,
          ),
          onPressed: () {
            Fluttertoast.showToast(msg: "扫一扫");
          },
        ),
        IconButton(
          icon: Image.asset(
            "assets/images/ic_notification.png",
            width: 30,
            height: 30,
          ),
          onPressed: () {
            Fluttertoast.showToast(msg: "消息");
          },
        ),
      ],
    );
  }

  buildBody(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyBanner(),
                  const SizedBox(height: 10),
                  Container(
                    height: 44,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    decoration: BoxDecoration(
                      color:  Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         const Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(Icons.location_on_outlined, size: 20),
                            SizedBox(width: 5),
                            Text('顺德区'),
                          ],
                        ),
                        Row(
                          children: [
                            Image.network(
                              "http://app1.showapi.com/weather/icon/day/00.png",
                              fit: BoxFit.cover,
                              width: 22,
                            ),
                            const SizedBox(width: 5),
                            const Text('晴 24°C'),
                          ],
                        ),
                        Row(
                          children: [
                            Image.network(
                              "http://app1.showapi.com/weather/icon/day/01.png",
                              fit: BoxFit.cover,
                              width: 22,
                            ),
                            const SizedBox(width: 5),
                            const Text('一小时后 多云'),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    children: List.generate(_dockList.length, (index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                            _dockList[index]['iconUrl'],
                            fit: BoxFit.cover,
                            width: 48,
                            height: 48,
                          ),
                          const SizedBox(height: 5.0),
                          Text(_dockList[index]['name'],
                              style: const TextStyle(fontSize: 14.0)),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(height: 16.0),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        const TabBar(
                          tabs: <Widget>[
                            Tab(text: "动态列表"),
                            Tab(text: "推荐专栏"),
                          ],
                        ),
                        SizedBox(
                          height: 500.0,
                          child: TabBarView(
                            children: <Widget>[
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 20,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:  Theme.of(context).cardColor,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "动态标题 $index",
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 8.0),
                                            Text(
                                              "动态内容 $index",
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            const SizedBox(height: 8.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                const Text(
                                                  "12-31",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.thumb_up,
                                                  size: 16.0,
                                                  color: Colors.grey,
                                                ),
                                                const SizedBox(width: 4.0),
                                                Text(
                                                  "$index",
                                                  style: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                const SizedBox(width: 8.0),
                                                const Icon(
                                                  Icons.comment,
                                                  size: 16.0,
                                                  color: Colors.grey,
                                                ),
                                                const SizedBox(width: 4.0),
                                                Text(
                                                  "$index",
                                                  style: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 20,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "专栏标题 $index",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              "专栏内容 $index",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "12-31",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.thumb_up,
                                                  size: 16.0,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(width: 4.0),
                                                Text(
                                                  "$index",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                SizedBox(width: 8.0),
                                                Icon(
                                                  Icons.comment,
                                                  size: 16.0,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(width: 4.0),
                                                Text(
                                                  "$index",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
