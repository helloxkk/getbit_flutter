import 'package:flutter/material.dart';

import '../../base/base_page.dart';

class MomentsPage extends BasePage {

  @override
  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: Text('动态'),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  '动态内容 $index',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Divider(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.chat_bubble_outline),
                    onPressed: () {},
                  ),
                  Text('99'),
                  IconButton(
                    icon: Icon(Icons.thumb_up_outlined),
                    onPressed: () {},
                  ),
                  Text('99'),
                  SizedBox(width: 16),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
