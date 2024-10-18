import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sunshine_task/screens/widget/carousel.dart';
import 'package:sunshine_task/screens/widget/horizontal_list.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../app_router/route_constants.dart';
import '../bottombar/app_bar.dart';
import '../bottombar/bottom_bar_state.dart';
import '../bottombar/bottom_nav_items.dart';
import '../components/category_box.dart';

class RateList extends ConsumerStatefulWidget {
  const RateList({super.key});

  @override
  ConsumerState<RateList> createState() => _RateListState();
}

class _RateListState extends ConsumerState<RateList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    'assets/images/bg.svg',
                    fit: BoxFit.fill,
                  ),
                ),
            
                // Overlay Row with text and icons
                Positioned(
                  top: 30.0, // Adjust positioning
                  left: 20.0,
                  right: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Column with icon and texts
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/brand_icon.svg',
                            fit: BoxFit.cover,
                          ), // Your icon
                          SizedBox(height: 8.0),
                          Text(
                            "Hello Anmol",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w600,
                              color: Colors.white, // Adjust text color
                            ),
                          ),
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w400,
                              color: Colors.white, // Adjust text color
                            ),
                          ),
                        ],
                      ),

                      // Profile and notification icons
                      Row(
                        children: [
                          IconButton(
                            icon: Image.asset(
                              'assets/images/profile_img.png',
                              // height: 50,
                            ),
                            onPressed: () {
                              // Add your action here
                            },
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/notification.svg',
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Notification button pressed!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 266,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Service',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(59, 49, 158, 1),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('See All tapped!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(35, 81, 219, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            ),
          ),


          // SizedBox(height: 500,),



        ],
      ),
    );
    }
}

// Stack(
// children: [
// // SVG image at the top
// SvgPicture.asset(
// 'assets/images/background_img.svg',
// height: 220.0, // Adjust height
// width: double.infinity,
// fit: BoxFit.cover,
// ),
//
// // Overlay Row with text and icons
// Positioned(
// top: 50.0, // Adjust positioning
// left: 20.0,
// right: 20.0,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// // Column with icon and texts
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SvgPicture.asset(
// 'assets/images/brand_icon.svg',
// fit: BoxFit.cover,
// ), // Your icon
// SizedBox(height: 8.0),
// Text(
// "Hello Anmol",
// style: TextStyle(
// fontSize: 20.sp,
// fontFamily: 'Rubik',
// fontWeight: FontWeight.w600,
// color: Colors.white, // Adjust text color
// ),
// ),
// Text(
// "Welcome Back",
// style: TextStyle(
// fontSize: 14.sp,
// fontFamily: 'Rubik',
// fontWeight: FontWeight.w400,
// color: Colors.white, // Adjust text color
// ),
// ),
// ],
// ),
//
// // Profile and notification icons
// Row(
// children: [
// IconButton(
// icon: Image.asset(
// 'assets/images/profile_img.png',
// // height: 50,
// ),
// onPressed: () {
// // Add your action here
// },
// ),
// IconButton(
// icon: SvgPicture.asset(
// 'assets/icons/notification.svg',
// ),
// onPressed: () {
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(
// content: Text('Notification button pressed!'),
// duration: Duration(seconds: 2),
// ),
// );
// },
// ),
// ],
// ),
// ],
// ),
// ),
//
// ],
// ),
//
//
//
//
//
//
//
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Service',
// style: TextStyle(
// fontSize: 20.0,
// fontFamily: 'Rubik',
// fontWeight: FontWeight.bold,
// color: Color.fromRGBO(59, 49, 158, 1),
// ),
// ),
// GestureDetector(
// onTap: (){
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(
// content: Text('See All tapped!'),
// duration: Duration(seconds: 2),
// ),
// );
// },
// child: Text(
// 'See All',
// style: TextStyle(
// fontSize: 16.0,
// fontFamily: 'Rubik',
// fontWeight: FontWeight.w500,
// color: Color.fromRGBO(35, 81, 219, 1),
// ),
// ),
// ),
// ],
// ),
// ),
// SizedBox(height: 8.0),
// HorizontalListView(),
// SizedBox(height: 8.0),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 6.0),
// child: CarouselView(),
// ),
// SizedBox(height: 8.0),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20.0),
// child: Text(
// 'Category',
// style: TextStyle(
// fontSize: 22.sp,
// fontFamily: 'Rubik',
// fontWeight: FontWeight.w600,
// color: Color.fromRGBO(59, 49, 158, 1),
// ),
// ),
// ),
// SizedBox(height: 8.0),
// Padding(
// padding: const EdgeInsets.only(left: 20, right: 10),
// child: Row(
// children: [
// Padding(
// padding: const EdgeInsets.only(right: 10),
// child: CategoryBox(
// img: 'assets/images/category_img1.png',
// color: Color.fromRGBO(0, 178, 232, 0.5),
// text: "Men's",
// onPressed: (){
// context.push('/${Routes.selectionScreen}');
// }
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(right: 10),
// child: CategoryBox(
// img: 'assets/images/category_img2.png',
// color: Color.fromRGBO(109, 77, 151, 0.5),
// text: "Women",
// onPressed: (){
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(
// content: Text('Women Container tapped!'),
// duration: Duration(seconds: 2),
// ),
// );
// }
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(0),
// child: CategoryBox(
// img: 'assets/images/category_img3.png',
// color: Color.fromRGBO(40, 87, 133, 0.5),
// text: "Kids",
// onPressed: (){
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(
// content: Text('Kids Container tapped!'),
// duration: Duration(seconds: 2),
// ),
// );
// },
// ),
// ),
// ],
// ),
// ),
// SizedBox(height: 10,)
//
//
