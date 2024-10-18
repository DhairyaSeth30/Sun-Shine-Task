import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HorizontalListView extends StatefulWidget {
  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  // Controller to keep track of the current page for dot indicators
  final PageController _pageController =
      PageController(viewportFraction: 0.33); // Shows 3 containers at a time

  final List<String> containerTitles = [
    "Premium Wash",
    "Dry Cleaning",
    "Steaming",
    "Premium Wash",
    "Dry Cleaning",
    "Steaming",
    "Premium Wash",
    "Dry Cleaning",
    "Steaming",
  ];

  final List<Color> containerColors = [
    Color.fromRGBO(125, 134, 226, 0.3),
    Color.fromRGBO(247, 75, 85, 0.3),
    Color.fromRGBO(245, 240, 187, 1),
    Color.fromRGBO(125, 134, 226, 0.3),
    Color.fromRGBO(247, 75, 85, 0.3),
    Color.fromRGBO(245, 240, 187, 1),
    Color.fromRGBO(125, 134, 226, 0.3),
    Color.fromRGBO(247, 75, 85, 0.3),
    Color.fromRGBO(245, 240, 187, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 15),
          height: 150.0,
          child: ListView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(containerTitles[index]+' tapped!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      width: 110,
                      height: 110,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: containerColors[index],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 22.0,
                            bottom: 22.0,
                            left: 10.0,
                            right: 10.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  10.0),
                              child: Image.asset(
                                'assets/images/services_img${index+1}.png',
                                fit: BoxFit
                                    .fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    containerTitles[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(59, 49, 158, 1)
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 1.0),  // Space between list and dot indicator

        // Dot indicator
        SmoothPageIndicator(
          controller: _pageController,
          count: (containerTitles.length / 3).ceil(),
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
    _pageController.dispose(); // Dispose the controller when not in use
    super.dispose();
  }
}



