import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../app_router/route_constants.dart';

class DateCarousel extends StatefulWidget {
  @override
  _DateCarouselState createState() => _DateCarouselState();
}

class _DateCarouselState extends State<DateCarousel> {
  int _selectedIndex = 0;
  int _selectedGridIndex = -1;
  List<DateTime> _dates = [];
  String _selectedMonth = 'Jan'; // Default selected month
  int _currentYear = DateTime.now().year; // Keep track of the current year
  int _selectedMonthIndex = 1; // Default to January (month index starts from 1)

  @override
  void initState() {
    super.initState();
    // Generate dates for the selected month
    _generateMonthDates();
  }

  final selectedGradient = LinearGradient(
    colors: [
      Color.fromRGBO(101, 24, 152, 1),
      Color.fromRGBO(44, 13, 143, 1)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Generate dates for the selected month
  void _generateMonthDates() {
    DateTime now = DateTime(_currentYear, _selectedMonthIndex, 1);
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    _dates.clear();
    for (int i = 1; i <= daysInMonth; i++) {
      _dates.add(DateTime(now.year, now.month, i));
    }
    setState(() {}); // Refresh the UI after generating the dates
  }

  // List of months to display in the dropdown
  final List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  final List<String> _time = [
    '08:00 Am', '09:00 Am', '10:00 Am',
    '11:00 Am', '12:00 Pm', '01:00 Pm',
    '02:00 Pm', '03:00 Pm', '04:00 Pm',
    '05:00 Pm', '06:00 Pm', '07:00 Pm',
    '08:00 Pm', '09:00 Pm', '10:00 Pm',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                          "Pickup Schedule",
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
          // Month picker dropdown
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Pickup Date',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(59, 49, 158, 1),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Month Dropdown
                      DropdownButton<String>(
                        value: _selectedMonth,
                        icon: Icon(
                            Icons.keyboard_arrow_down,
                          color: Color.fromRGBO(59, 49, 158, 1),
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedMonth = newValue!;
                            _selectedMonthIndex = _months.indexOf(newValue) + 1;
                            _generateMonthDates();
                          });
                        },
                        items: _months.map<DropdownMenuItem<String>>((String month) {
                          return DropdownMenuItem<String>(
                            value: month,
                            child: Text(
                                month,
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Rubik',
                                color: Color.fromRGBO(59, 49, 158, 1),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Carousel showing dates
          CarouselSlider.builder(
            itemCount: _dates.length,
            itemBuilder: (context, index, realIndex) {
              DateTime date = _dates[index];
              bool isSelected = index == _selectedIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: _buildDateContainer(date, isSelected),
              );
            },
            options: CarouselOptions(
              height: 100, // Adjust height for proper visibility
              aspectRatio: 2.0, // Set an appropriate aspect ratio
              viewportFraction: 0.2, // Show 5 items in view
              initialPage: 0,
              enableInfiniteScroll: false,
              pageSnapping: true, // Enables snapping to each item
              onPageChanged: (index, reason) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              scrollDirection: Axis.horizontal,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 16,),
            child: Text(
                'Pickup Time',
              style: TextStyle(
                fontSize: 22.sp,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(59, 49, 158, 1),
              ),
            ),
          ),

          // GridView showing 5 rows and 3 columns below the Carousel
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 16.0),
              child: GridView.builder(
                itemCount: 15, // 5 rows x 3 columns = 15 items
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 columns
                  mainAxisSpacing: 8, // spacing between rows
                  crossAxisSpacing: 8, // spacing between columns
                  childAspectRatio: 113 / 60, // width / height ratio
                ),
                itemBuilder: (context, index) {
                  bool isGridSelected = index == _selectedGridIndex;
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        _selectedGridIndex = index;
                      });

                    },
                    child: Container(
                      width: 113,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: isGridSelected ? selectedGradient : null,
                        color: isGridSelected ? null: Color.fromRGBO(177, 110, 222, 0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          _time[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16.0),
            child: GestureDetector(
              onTap: (){
                context.push('/${Routes.paymentMethodPage}');
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
                  BorderRadius.circular(50.0),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 21.sp,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build date container with Weekday and Day
  Widget _buildDateContainer(DateTime date, bool isSelected) {

    String weekDay = DateFormat('EEE').format(date); // Short weekday name
    String day = DateFormat('d').format(date);       // Day of the month

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        gradient: isSelected ? selectedGradient : null,
        color: isSelected ? null : Color.fromRGBO(177, 110, 222, 0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 80, // Set a fixed width for uniformity
      height: 100, // Set a fixed height for uniformity
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weekDay,
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            day,
            style: TextStyle(
              fontSize: 22.sp,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}







