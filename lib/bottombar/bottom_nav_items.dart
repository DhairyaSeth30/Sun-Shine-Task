import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// List<BarItem> bottomBarItems(BuildContext context){
//   return [
//     BarItem(
//       filledIcon:Icons.home_filled,
//       label: "Home",
//       outlinedIcon: Icons.home_outlined,
//       toolTip: "Home",
//     ),
//     BarItem(
//         filledIcon: Icons.calendar_month,
//         label: "Calender",
//         outlinedIcon: Icons.calendar_month_outlined,
//         toolTip: "Calender",
//     ),
//
//     BarItem(
//       filledIcon: Icons.leave_bags_at_home,
//       label: "Leave Tracker",
//       toolTip: "Leave Tracker",
//       outlinedIcon: Icons.leave_bags_at_home_outlined,
//     ),
//     BarItem(
//       filledIcon: Icons.tour_rounded,
//       label: "Tour Tracker",
//       toolTip: "Tour Tracker",
//       outlinedIcon: Icons.tour_outlined,
//     ),
//   ];
// }

List<BottomNavigationBarItem> bottomNavItems(BuildContext context) {
  return [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/home_icon.svg',
      ),
      label: "Home",
      activeIcon: SvgPicture.asset('assets/icons/home_icon.svg'),
      tooltip: "Home",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/rate_icon.svg',
      ),
      label: "Rate List",
      activeIcon: SvgPicture.asset(
        'assets/icons/rate_icon.svg',
      ),
      tooltip: "Rate List",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/order_icon.svg',
      ),
      label: "order",
      tooltip: "Order",
      activeIcon: SvgPicture.asset(
        'assets/icons/order_icon.svg',
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/profile_icon.svg',
      ),
      label: "Profile",
      tooltip: "Profile",
      activeIcon: SvgPicture.asset(
        'assets/icons/profile_icon.svg',
      ),
    ),
  ];
}
