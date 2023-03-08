import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class MyBanner extends StatefulWidget {

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<MyBanner> {
  int _currentIndex = 0;

  final List<String> _imageUrls = [
    'https://picsum.photos/id/1015/500/300',
    'https://picsum.photos/id/1016/500/300',
    'https://picsum.photos/id/1018/500/300',
    'https://picsum.photos/id/1019/500/300',
  ];

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
                child: Image.network(
                  _imageUrls[index],
                  fit: BoxFit.cover,
                ),
              );
            },
            itemCount: _imageUrls.length,
            autoplay: true,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.white,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
