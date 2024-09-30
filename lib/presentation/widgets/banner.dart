import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class banner extends StatelessWidget {
  const banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Image.network(
              'http://devapiv4.dealsdray.com/icons/banner.png'),
          Image.network(
              'http://devapiv4.dealsdray.com/icons/banner.png'),
          Image.network(
              'http://devapiv4.dealsdray.com/icons/banner.png'),
        ],
        options: CarouselOptions(
          height: 200,
          // viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration:
              const Duration(milliseconds: 800),
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ));
  }
}
