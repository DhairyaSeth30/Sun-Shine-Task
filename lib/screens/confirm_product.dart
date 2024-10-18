import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sunshine_task/components/rounded_button.dart';
import 'package:sunshine_task/components/sm_rounded_button.dart';

import '../app_router/route_constants.dart';

class ConfirmProduct extends StatelessWidget {
  const ConfirmProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
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
                          "Product",
                          style: TextStyle(
                            fontSize: 22.0,
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    _buildCustomListTile(
                      imgUrl: "assets/images/shirt_img1.png",
                      title: "Shirts 1",
                      subtitle: "Premium Wash",
                      bottomText: 'Blue/Bubble/Normal packing/Testing/Kalf/Iron'
                    ),
                    SizedBox(height: 5,),
                    _buildCustomListTile(
                        imgUrl: "assets/images/shirt_img1.png",
                        title: "Shirts 1",
                        subtitle: "Premium Wash",
                        bottomText: 'White/Bubble/Normal packing'
                    ),
                    SizedBox(height: 5,),
                    _buildCustomListTile(
                        imgUrl: "assets/images/shirt_img2.png",
                        title: "Shirts 2",
                        subtitle: "Dry Cleaning",
                        bottomText: 'Green/Oil/Normal packing'
                    ),
                    SizedBox(height: 5,),
                    _buildCustomListTile(
                        imgUrl: "assets/images/shirt_img2.png",
                        title: "Shirts 2",
                        subtitle: "Dry Cleaning",
                        bottomText: 'Green/Oil/Normal packing'
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmRoundedButton(
                          title: 'Add Coupon',
                          onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Coupon button pressed!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }),

                        SmRoundedButton(
                          title: 'Check Discount',
                          onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Discount button pressed!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RoundedButton(
                title: 'Continue Order',
                onPressed: (){
                  context.push('/${Routes.discountScreen}');
                },
                textColor: Colors.white
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(101, 24, 152, 1), Color.fromRGBO(44, 13, 143, 1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            // padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price (4 Items)",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            "₹ 400",
                            style: TextStyle(fontSize: 16.sp, fontFamily: 'Rubik', fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Rubik',
                                color: Colors.white
                            ),
                          ),
                          Text(
                            "₹ 50",
                            style: TextStyle(fontSize: 16.sp, fontFamily: 'Rubik', fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(fontSize: 18.sp, fontFamily: 'Rubik', fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                          Text(
                            "₹ 350",
                            style: TextStyle(fontSize: 18.sp, fontFamily: 'Rubik', fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Divider(height: 4,),
                Divider(height: 4,),
                SizedBox(height: 8, width: double.infinity,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build a custom ListTile
  Widget _buildCustomListTile({required String imgUrl, required String title, required String subtitle, required String bottomText}) {
    return Card(
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            // isThreeLine: true,
            contentPadding: EdgeInsets.only(left: 10, right: 5),
            leading: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Rubik',
                  color: Color.fromRGBO(59, 49, 158, 1)
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    subtitle,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Rubik',
                      color: Color.fromRGBO(59, 49, 158, 1)
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    "₹ 100",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    fontFamily: 'Rubik',
                    color: Color.fromRGBO(59, 49, 158, 1)
                  ),
                ),
                SizedBox(width: 10.w,),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/edit_icon.svg'),
                  onPressed: () {
          
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h, bottom: 2.h, right: 5.h),
            child: Text(
                bottomText,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(59, 49, 158, 1)
              ),
            ),
          )
        ],
      ),
    );
  }
}




