import 'package:flutter/material.dart';

import '../../base_page.dart';

class ServicesPage extends BasePage {
  @override
  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: const Text('服务'),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text('服务标题 $index'),
            subtitle: Text('服务描述 $index'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
        );
      },
    );
  }
}
