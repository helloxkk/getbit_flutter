import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final List<String> labels;
  final List<String> iconPaths;
  final List<String> activeIconPaths;

  MyBottomNavigationBar({
    required this.labels,
    required this.iconPaths,
    required this.activeIconPaths,
  });

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.green,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: List.generate(
        widget.labels.length,
            (index) => BottomNavigationBarItem(
          icon: Image.asset(
            widget.iconPaths[index],
            width: 24.0,
            height: 24.0,
          ),
          activeIcon: Image.asset(
            widget.activeIconPaths[index],
            width: 24.0,
            height: 24.0,
          ),
          label: widget.labels[index],
        ),
      ),
    );
  }
}
