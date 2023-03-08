import 'package:flutter/material.dart';

// 发布动态页面
class PostMomentPage extends StatefulWidget {
  @override
  _PostMomentPageState createState() => _PostMomentPageState();
}

class _PostMomentPageState extends State<PostMomentPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布动态'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          maxLines: 5,
          maxLength: 200,
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: '请输入动态内容...',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}