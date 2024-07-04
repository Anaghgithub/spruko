import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel1 extends StatefulWidget {
  const Carousel1({super.key});

  @override
  _Carousel1State createState() => _Carousel1State();
}

class _Carousel1State extends State<Carousel1> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;
  final List<String> imgList = [
    'lib/Assets/images/download.jpeg',
    'lib/Assets/images/img (130).jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: screenWidth * 0.8, 
          child: CarouselSlider(
            items: imgList.map((item) => Image.asset(item, fit: BoxFit.cover, width: screenWidth)).toList(),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              height: screenHeight * 0.5,
              autoPlay: true,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          left: 25,
          child: IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.grey, size: 60),
            onPressed: () {
              buttonCarouselController.previousPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            },
          ),
        ),
        Positioned(
          right: 25,
          child: IconButton(
            icon: const Icon(Icons.chevron_right, color: Colors.grey, size: 60),
            onPressed: () {
              buttonCarouselController.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            },
          ),
        ),
        Positioned(
          bottom: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => buttonCarouselController.animateToPage(entry.key),
                child: Container(
                  width: 35.0,
                  height: 3.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey
                            : Colors.white)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
