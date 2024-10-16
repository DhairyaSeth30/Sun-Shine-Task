
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        top: 50.0, // Adjust positioning
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
                                  "Payment Method",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white, // Adjust text color
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 5.0),
                    child: SvgPicture.asset(
                      'assets/images/debit_card_img.svg',
                      height: 230.0,
                      width: double.infinity,
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3, // Total number of containers
                      effect: WormEffect(
                        dotHeight: 8.0,
                        dotWidth: 8.0,
                        activeDotColor:
                            Color.fromRGBO(44, 13, 143, 1), // Active dot color
                        dotColor: Colors.grey, // Inactive dot color
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                    child: Text(
                      'Other Payment Methods',
                      style: TextStyle(
                        color: Color.fromRGBO(59, 49, 158, 1),
                        fontSize: 22.sp,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10.0),
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Debit/Credit card tapped!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: paymentMethods(
                          imageUrl: 'assets/icons/payment_card_icon.png',
                          title: 'Debit/Credit Card'),
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(59, 49, 158, 1),
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15.0),
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Google pay tapped!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: paymentMethods(
                          imageUrl: 'assets/icons/google_pay_icon.png',
                          title: 'Google Pay'),
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(59, 49, 158, 1),
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15.0),
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Paytm tapped!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: paymentMethods(
                          imageUrl: 'assets/icons/paytm_icon.png',
                          title: 'Paytm'),
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(59, 49, 158, 1),
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15.0),
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('PhonePe tapped!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: paymentMethods(
                          imageUrl: 'assets/icons/phone_pay_icon.png',
                          title: 'PhonePe'),
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(59, 49, 158, 1),
                    height: 1,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16.0, top: 15),
            child: GestureDetector(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Pay now button pressed!'),
                    duration: Duration(seconds: 2),
                  ),
                );
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
                  BorderRadius.circular(50.0), // Same as Card's shape
                ),
                child: Center(
                  child: Text(
                    "Pay Now",
                    style: TextStyle(fontSize: 21.0, fontFamily: 'Rubik', fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentMethods({required String imageUrl, required String title}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(59, 49, 158, 1),
          ),
        ),
      ],
    );
  }
}
