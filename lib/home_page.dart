import 'package:flutter/material.dart';
import 'package:rural_revitalize_flutter/title_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _ScrollableHomePageState createState() => _ScrollableHomePageState();
}

class _ScrollableHomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _showTitle = _scrollController.offset > 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            TitleBar(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 200,
                    color: Colors.white,
                  ),
                  Container(
                    height: 200,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 200,
                    color: Colors.green,
                  ),
                  Container(
                    height: 200,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 200,
                    color: Colors.white12,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
