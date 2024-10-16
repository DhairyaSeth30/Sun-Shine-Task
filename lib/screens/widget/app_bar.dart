//
// import 'package:flutter/material.dart';
//
//
// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final String title;
//   final VoidCallback onMenuPressed;
//
//   const CustomAppBar({Key? key, required this.title, required this.onMenuPressed}) : super(key: key);
//
//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
// class _CustomAppBarState extends State<CustomAppBar> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void _toggleMenu() {
//     if (_animationController.isCompleted) {
//       _animationController.reverse();
//     } else {
//       _animationController.forward();
//     }
//     widget.onMenuPressed();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Center(
//         child: Text(
//           widget.title,
//           style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//               color: Theme.of(context).colorScheme.onPrimary,
//               fontSize: 20
//           ),
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.wallet),
//           onPressed: () {
//             // Handle wallet button press
//           },
//           tooltip: 'Wallet',
//         ),
//         IconButton(
//           icon: const Icon(Icons.language_sharp),
//           onPressed: () {
//             // Handle settings button press
//           },
//           tooltip: 'Language',
//         ),
//         IconButton(
//           icon: const Icon(Icons.search_outlined),  // Replace with another icon if needed
//           onPressed: () {
//
//           },
//           tooltip: 'Support',
//         ),
//       ],
//       backgroundColor: Colors.transparent,  // Make the AppBar background transparent
//       elevation: 4.0,
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/your_background_image.png'),  // Set your background image here
//             fit: BoxFit.cover,  // Fit the image to cover the entire app bar
//           ),
//         ),
//       ),
//     );
//
//   }
// }
