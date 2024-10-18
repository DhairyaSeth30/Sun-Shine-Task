import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../app_router/route_constants.dart';
import '../components/rounded_button.dart';
import 'confirm_product.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  int selectedCategoryIndex = -1;
  int selectedSmallContainerIndex = -1;
  List<int> _quantities = [1, 1, 1, 2, 2, 1, 1];

  // To keep track of quantities for each ListTile
  List<int> quantities = List.generate(7, (index) => 1);

  final List<String> containerTitles = [
    "Premium Wash",
    "Dry Cleaning",
    "Steaming",
    "Wash & Ironing"
  ];

  // Gradient color for selected items
  final selectedGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(101, 24, 152, 0.9),
      Color.fromRGBO(44, 13, 143, 0.9)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

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
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Rubik',
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
                            content: Text('Notification pressed!'),
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    // Row with Men, Women, Kids containers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCategoryContainer("Men", 0),
                        _buildCategoryContainer("Women", 1),
                        _buildCategoryContainer("Kids", 2),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // First column with 4 small containers
                        Container(
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(233, 199, 255, 1),
                                Color.fromRGBO(207, 192, 255, 1)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            children: List.generate(4, (index) {
                              return Padding(
                                padding:
                                     EdgeInsets.symmetric(vertical: 5.h),
                                child: _buildSmallContainer(
                                    containerTitles[index], index),
                              );
                            }),
                          ),
                        ),
                        SizedBox(width: 2.h),
                        // Second column with modified ListTiles
                        Expanded(
                          flex: 2,
                          child: Column(children: [
                            _buildCustomListTile(
                              title: 'Blazer',
                              price: "100",
                              subtitle: 'Premium Wash',
                              imgUrl: 'assets/images/product_img1.png',
                              quantity: _quantities[0],
                              onQuantityChanged: (newQuantity) {
                                setState(() {
                                  _quantities[0] =
                                      newQuantity;
                                });
                              },
                            ),
                            _buildCustomListTile(
                              title: 'Pants',
                              price: "100",
                              subtitle: 'Premium Wash',
                              imgUrl: 'assets/images/product_img2.png',
                              quantity: _quantities[1],
                              onQuantityChanged: (newQuantity) {
                                setState(() {
                                  _quantities[1] =
                                      newQuantity;
                                });
                              },
                            ),
                            _buildCustomListTile(
                              title: 'Kurta',
                              price: "100",
                              subtitle: 'Premium Wash',
                              imgUrl: 'assets/images/product_img3.png',
                              quantity: _quantities[2],
                              onQuantityChanged: (newQuantity) {
                                setState(() {
                                  _quantities[2] =
                                      newQuantity;
                                });
                              },
                            ),
                            _buildCustomListTile(
                              title: 'Shirts',
                              price: "200",
                              subtitle: 'Premium Wash',
                              imgUrl: 'assets/images/product_img4.png',
                              quantity: _quantities[3],
                              onQuantityChanged: (newQuantity) {
                                setState(() {
                                  _quantities[3] =
                                      newQuantity;
                                });
                              },
                            ),
                            _buildCustomListTile(
                              title: 'T-Shirts',
                              price: "200",
                              subtitle: 'Premium Wash',
                              imgUrl: 'assets/images/product_img5.png',
                              quantity: _quantities[4],
                              onQuantityChanged: (newQuantity) {
                                setState(() {
                                  _quantities[4] =
                                      newQuantity;
                                });
                              },
                            ),
                            _buildCustomListTile(
                              title: 'Shorts',
                              price: "100",
                              subtitle: 'Premium Wash',
                              imgUrl: 'assets/images/product_img6.png',
                              quantity: _quantities[5],
                              onQuantityChanged: (newQuantity) {
                                setState(() {
                                  _quantities[5] =
                                      newQuantity;
                                });
                              },
                            ),
                            _buildCustomListTile(
                              title: 'Lower',
                              price: "100",
                              subtitle: 'Premium Wash',
                              imgUrl: 'assets/images/product_img7.png',
                              quantity: _quantities[6],
                              onQuantityChanged: (newQuantity) {
                                setState(() {
                                  _quantities[6] =
                                      newQuantity;
                                });
                              },
                            ),
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min, // To avoid extra space
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: RoundedButton(
                      title: 'Continue',
                      onPressed: () {
                        context.push('/${Routes.confirmProduct}');
                      },
                      textColor: Colors.white)
              ),
              SizedBox(height: 16.0),
              // Bottom container with price details
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(101, 24, 152, 1),
                      Color.fromRGBO(44, 13, 143, 1)
                    ],
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
                      padding: const EdgeInsets.only(
                          top: 18.0, left: 18.0, right: 18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // Ensures the container only takes the space it needs
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
                                    color: Colors.white),
                              ),
                              Text(
                                "₹ 400",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Rubik'
                                ),
                              ),
                              Text(
                                "₹ 400",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Rubik'
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Divider(
                      height: 4,
                    ),
                    Divider(
                      height: 4,
                    ),
                    SizedBox(
                      height: 8,
                      width: double.infinity,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Method to build the category containers (Men, Women, Kids)
  Widget _buildCategoryContainer(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategoryIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Container(
            height: 40.0,
            decoration: BoxDecoration(
              gradient:
                  selectedCategoryIndex == index ? selectedGradient : null,
              color: selectedCategoryIndex == index ? null : Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Rubik',
                    color: selectedCategoryIndex == index
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomListTile({
    required String title,
    required String price,
    required String subtitle,
    required String imgUrl,
    required int quantity,
    required ValueChanged<int> onQuantityChanged,
  }) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 4.h),
        child: Row(
          children: [
            Container(
              height: 50.h,
              width: 42.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(233, 199, 255, 1),
                    Color.fromRGBO(207, 192, 255, 1)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 5,
                    left: 5,
                    bottom: 5,
                    right: 5,
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(59, 49, 158, 1)),
                ),
                Text(
                  '₹ $price',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(59, 49, 158, 1)),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(59, 49, 158, 1)),
                ),
              ],
            ),
            IconButton(
              icon: Image.asset('assets/icons/low_icon.png'),
              onPressed: () {
                if (quantity > 1) {
                  onQuantityChanged(quantity - 1);
                }
              },
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 1.0),
              width: 15.w,
              height: 16.h,
              decoration:
                  BoxDecoration(border: Border.all(width: 2.0, color: Color.fromRGBO(101, 24, 152, 1))),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  '$quantity',
                    style: TextStyle(
                        fontSize: 10,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(59, 49, 158, 1)
                    ),
                    ),
              ),
            ),
            IconButton(
              icon: Image.asset('assets/icons/high_icon.png'),
              onPressed: () {
                onQuantityChanged(quantity + 1);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Method to build small containers
  Widget _buildSmallContainer(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSmallContainerIndex = index;
        });
      },
      child: Container(
        height: 58.0,
        width: 75.0,
        decoration: BoxDecoration(
          gradient:
              selectedSmallContainerIndex == index ? selectedGradient : null,
          color: selectedSmallContainerIndex == index ? null : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Rubik',
                color: selectedSmallContainerIndex == index
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
