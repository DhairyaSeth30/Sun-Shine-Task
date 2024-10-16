// import 'package:flutter/material.dart';
//
// class CustomBottomNavigationBar extends StatefulWidget {
//   final int currentIndex;
//   final ValueChanged<int> onTap;
//   final List<BottomNavigationBarItem> items;
//
//   const CustomBottomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//     required this.items,
//   }) : super(key: key);
//
//   @override
//   _CustomBottomNavigationBarState createState() =>
//       _CustomBottomNavigationBarState();
// }
//
// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   Widget _buildItem(int index) {
//     bool isSelected = widget.currentIndex == index;
//
//     return GestureDetector(
//       onTap: () {
//         _animationController.forward(from: 0);
//         widget.onTap(index);
//       },
//       child: Column(
//         // Use a Column to display icon and label vertically
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 200),
//             curve: Curves.easeInCirc,
//             width: isSelected ? 35 : 20,
//             height: isSelected ? 35 : 20,
//             decoration: BoxDecoration(
//               color: isSelected
//                   ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color
//                   : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color,
//               borderRadius: BorderRadius.circular(40),
//             ),
//             child: Center(
//               child: AnimatedOpacity(
//                 opacity: isSelected ? 1 : 0.5,
//                 duration: const Duration(milliseconds: 200),
//                 child: widget.items[index].activeIcon,
//               ),
//             ),
//           ),
//           SizedBox(height: 2),
//           AnimatedDefaultTextStyle(
//             duration: const Duration(milliseconds: 200),
//             style: TextStyle(
//               color: isSelected
//                   ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
//                   : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
//               fontWeight: isSelected
//                   ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle?.fontWeight
//                   : Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle?.fontWeight,
//               fontSize: isSelected
//                   ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle?.fontSize
//                   : Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle?.fontSize,
//             ),
//
//             child: Text(widget.items[index].label ?? ''), // Display the label
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height*0.08,
//       color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: List.generate(widget.items.length, (index) => _buildItem(index)),
//       ),
//     );
//   }
// }
