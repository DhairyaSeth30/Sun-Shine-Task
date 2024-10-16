
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselView extends StatefulWidget {
  @override
  _CarouselViewState createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  // Controller to keep track of the current page for dot indicators
  final PageController _pageController = PageController();

  // List of image paths for containers
  final List<String> imgList = [
    "assets/images/carousel_img.png",
    "assets/images/carousel_img.png",
    "assets/images/carousel_img.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Horizontal ListView for square containers
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 130.0,  // Set the height for square containers
            child: PageView.builder(
              controller: _pageController,
              itemCount: imgList.length,  // Use imgList length for dynamic content
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.purple,  // Fallback background color
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(imgList[index]),  // Path to your images
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
          controller: _pageController,  // The page controller
          count: imgList.length,  // Number of images
          effect: WormEffect(
            dotHeight: 8.0,
            dotWidth: 8.0,
            activeDotColor: Color.fromRGBO(44, 13, 143, 1),  // Active dot color
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