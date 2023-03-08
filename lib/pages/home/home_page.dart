import 'package:flutter/material.dart';
import '../../base_page.dart';
import 'home_banner.dart';

class HomePage extends BasePage {
  final List<Map<String, dynamic>> _functions = [
    {'icon': Icons.send, 'text': '发消息'},
    {'icon': Icons.photo_camera, 'text': '拍照'},
    {'icon': Icons.phone, 'text': '打电话'},
    {'icon': Icons.near_me, 'text': '附近'},
    {'icon': Icons.directions_car, 'text': '开车'},
    {'icon': Icons.music_note, 'text': '音乐'},
    {'icon': Icons.movie, 'text': '电影'},
    {'icon': Icons.shopping_basket, 'text': '购物'},
  ];

  @override
  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: const Text('首页'),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyBanner(),
                  SizedBox(height: 10),
                  Container(
                    height: 44,
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(Icons.location_on),
                            SizedBox(width: 5),
                            Text('位置'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.cloud),
                            SizedBox(width: 5),
                            Text('今日天气'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.cloud),
                            SizedBox(width: 5),
                            Text('一小时后天气'),
                            SizedBox(width: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    children: List.generate(_functions.length, (index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(_functions[index]['icon'], size: 32.0),
                          SizedBox(height: 8.0),
                          Text(_functions[index]['text'],
                              style: TextStyle(fontSize: 12.0)),
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 16.0),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        TabBar(
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
                                              "动态标题 $index",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              "动态内容 $index",
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
