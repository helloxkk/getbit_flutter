import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class MyBanner extends StatefulWidget {

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<MyBanner> {
  int _currentIndex = 0;
  List<Widget> _imageList = [];

  @override
  void initState() {
    super.initState();
    _loadBannerList();
  }

  Future<void> _loadBannerList() async {
    try {
      String jsonString =
      await rootBundle.loadString('assets/json/banner_list.json');
      List<dynamic> bannerList = json.decode(jsonString);
      setState(() {
        _imageList = bannerList.map((item) {
          return Image.network(
            item['imgUrl'],
            fit: BoxFit.cover,
          );
        }).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _imageList[index],
              );
            },
            itemCount: _imageList.length,
            autoplay: true,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                size: 6,
                activeSize: 6,
                space: 2,
                activeColor: Colors.white,
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
