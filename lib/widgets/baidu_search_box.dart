import 'package:flutter/material.dart';

class BaiduSearchBox extends StatefulWidget {
  const BaiduSearchBox({Key? key}) : super(key: key);

  @override
  _BaiduSearchBoxState createState() => _BaiduSearchBoxState();
}

class _BaiduSearchBoxState extends State<BaiduSearchBox> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 2.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: _searchTextController,
              decoration: InputDecoration(
                hintText: '百度一下，你就知道',
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                // 处理搜索
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              _searchTextController.clear();
            },
            child: const Icon(Icons.clear, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
