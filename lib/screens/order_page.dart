import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // SVG image at the top
                SvgPicture.asset(
                  'assets/images/background_img.svg',
                  height: 180.h,
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
                              context.go('/');
                            },
                            child: SvgPicture.asset(
                              'assets/icons/left_arrow_icon.svg',
                            ),
                          ),
                          SizedBox(width: 12.0),
                          Text(
                            "Active Order",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Rubik',
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
            // Order ID and Cancel Button
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(202, 90, 255, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),  // Circular radius for top left corner
                    topRight: Radius.circular(20), // Circular radius for top right corner
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order #Dty0010C5',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22.sp,
                                fontFamily: 'Rubik',
                                color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              // Define cancel action
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  fontFamily: 'Rubik',
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),  // Circular radius for top left corner
                    bottomRight: Radius.circular(20), // Circular radius for top right corner
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(233, 199, 255, 0.5),
                      Color.fromRGBO(207, 192, 255, 0.5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                ),
                child: Column(
                  children: [
                    _buildDetailRow('Product Name', 'Blazer'),
                    Divider(height: 2,),
                    _buildDetailRow('Quantity', '1 Item'),
                    Divider(height: 2,),
                    _buildDetailRow('Pickup Date', '18/Jun/2023'),
                    Divider(height: 2,),
                    _buildDetailRow('Pickup Time', '12:00 PM'),
                    Divider(height: 2,),
                    _buildDetailRow('Delivery Date', '20/Jun/2023'),
                    Divider(height: 2,),
                    _buildDetailRow('Delivery Time', '02:00 PM'),
                    Divider(height: 2,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Delivery Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: Color.fromRGBO(59, 49, 158, 1), fontSize: 20.sp, fontFamily: 'Rubik')
                          ),
                          Text(
                              'Yashwant Kunj Lbs Marg Hariniwa Main Road, Nagpur 512505 (M.H.)',
                              style: TextStyle(color: Color.fromRGBO(59, 49, 158, 1), fontSize: 18.sp, fontWeight: FontWeight.w400, fontFamily: 'Rubik')
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 2,),
                    _buildDetailRow('Payment Mode', 'Cash'),
                    Divider(height: 2,),
                    _buildDetailRow('Total', '₹50'),
                    Divider(height: 2,),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Track order pressed!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              height: 55.0,
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
                                  "Track Order",
                                  style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Rubik'),
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(width: 10),
                          GestureDetector(
                            onTap: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Invoice pressed!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              height: 55.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3.0,
                                  color: Color.fromRGBO(101, 24, 152, 1)
                                ),
                                borderRadius: BorderRadius.circular(60.0), // Same as Card's shape
                              ),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Invoice",
                                    style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600, color: Color.fromRGBO(59, 49, 158, 1), fontFamily: 'Rubik'),
                                  ),
                                  SizedBox(width: 8,),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(59, 49, 158, 1),
                                      borderRadius: BorderRadius.circular(60)
                                    ),
                                    // child: Image.asset('assets/icons/right_arrow.png'),
                                    child: Icon(
                                        Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Color.fromRGBO(59, 49, 158, 1), fontSize: 20, fontFamily: 'Rubik'),
          ),
          Text(value, style: TextStyle(color: Color.fromRGBO(59, 49, 158, 1), fontSize: 18, fontWeight: FontWeight.w400, fontFamily: 'Rubik')),
        ],
      ),
    );
  }
}
