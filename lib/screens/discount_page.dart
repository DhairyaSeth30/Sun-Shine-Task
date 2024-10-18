import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../app_router/route_constants.dart';

class DiscountScreen extends StatefulWidget {
  @override
  _DiscountScreenState createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  int? _selectedRadio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // SVG image at the top
              SvgPicture.asset(
                'assets/images/background_img.svg',
                height: 190.h,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              // Overlay Row with text and icons
              Positioned(
                top: 50.0,
                left: 20.0,
                right: 20.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Column with icon and texts
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            context.pop(context);
                          },
                          child: SvgPicture.asset(
                            'assets/icons/left_arrow_icon.svg',
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Text(
                          "Discount",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    // Profile and notification icons
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
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    discountCard(0),
                    SizedBox(
                      height: 12,
                    ),
                    discountCard(1),
                    SizedBox(
                      height: 12,
                    ),
                    discountCard(2),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: GestureDetector(
              onTap: (){
                context.push('/${Routes.calenderPage}');
              },
              child: Container(
                width: double.infinity,
                height: 51.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(101, 24, 152, 0.9),
                      Color.fromRGBO(44, 13, 143, 0.9)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius:
                  BorderRadius.circular(10.0), // Same as Card's shape
                ),
                child: Center(
                  child: Text(
                    "Apply Discount",
                    style: TextStyle(fontSize: 21.sp, fontFamily: 'Rubik', fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container discountCard(int index) {
    return Container(
      // height: 130,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(101, 24, 152, 0.9),
            Color.fromRGBO(44, 13, 143, 0.9)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10.0), // Same as Card's shape
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.3, // Increase the size by adjusting the scale
              child: Radio(
                value: index,
                groupValue: _selectedRadio,
                onChanged: (int? value) {
                  setState(() {
                    _selectedRadio = value;
                  });
                },
                activeColor:
                    Colors.white,
                fillColor: MaterialStateProperty.all(
                    Colors.white), // Unselected state color
              ),
            ),

            // Column with discount details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get 50% Discount",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        fontFamily: 'Rubik',
                        color: Colors.white),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    "Use code sindero50 & get 50% discount.\nOther T&Cs may apply.",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik',
                        color: Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      "Special 50%",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
