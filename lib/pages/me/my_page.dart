import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../base/base_page.dart';

class MyPage extends BasePage {
  @override
  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      leading: null,
      title: null,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.black87),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.headset_mic, color: Colors.black87),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildAvatar(),
          const SizedBox(height: 0),
          buildService(),
        ],
      ),
    );
  }

  Widget buildAvatar() {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/avatar.png',
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '小程序员',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '江苏省南京市',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildService() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0),
          Text(
            '我的服务',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildServiceItem(
                'assets/images/feedback.png',
                '意见反馈',
                () => Fluttertoast.showToast(msg: '点击了意见反馈'),
              ),
              _buildServiceItem(
                'assets/images/feedback.png',
                '关于我们',
                () => Fluttertoast.showToast(msg: '点击了关于我们'),
              ),
              _buildServiceItem(
                'assets/images/feedback.png',
                '客服热线',
                () => Fluttertoast.showToast(msg: '点击了客服热线'),
              ),
              _buildServiceItem(
                'assets/images/feedback.png',
                '分享我们',
                () => Fluttertoast.showToast(
                    msg: "This is Center Short Toast",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(String imagePath, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 24,
            height: 24,
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
