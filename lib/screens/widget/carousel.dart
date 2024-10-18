
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselView extends StatefulWidget {
  @override
  _CarouselViewState createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  final PageController _pageController = PageController();

  final List<String> imgList = [
    "assets/images/carousel_img.png",
    "assets/images/carousel_img.png",
    "assets/images/carousel_img.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 130.0,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imgList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(imgList[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        SizedBox(height: 2.0),  // Space between list and dot indicator

        // Dot indicator
        SmoothPageIndicator(
          controller: _pageController,
          count: imgList.length,
          effect: WormEffect(
            dotHeight: 8.0,
            dotWidth: 8.0,
            activeDotColor: Color.fromRGBO(44, 13, 143, 1),
            dotColor: Colors.grey,  // Inactive dot color
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();  // Dispose the controller when not in use
    super.dispose();
  }
}