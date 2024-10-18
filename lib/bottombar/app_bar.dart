import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import '../app_router/route_constants.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final int position;
  final VoidCallback onMenuPressed;

  const CustomAppBar(
      {Key? key,
      required this.position,
      required this.title,
      required this.onMenuPressed})
      : super(key: key);

  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends ConsumerState<CustomAppBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  void _showPopupMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          100.h, kToolbarHeight, 0, 0), // Adjust position as needed
      items: [
        PopupMenuItem(
          value: 'profile',
          child: Text('Profile'),
        ),
        PopupMenuItem(
          value: 'settings',
          child: Text('Settings'),
        ),
        PopupMenuItem(
          value: 'logout',
          child: Text('Logout'),
        ),
      ],
    ).then((value) {
      switch (value) {
        case 'profile':
        // Navigate to profile page or show profile details
          break;
        case 'settings':
        // Navigate to settings page
          break;
        case 'logout':
        // Handle logout action
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return AppBar(
    //   backgroundColor: Colors.transparent, // Make AppBar background transparent
    //   elevation: 0, // Remove the shadow
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent, // Make status bar transparent
    //     statusBarIconBrightness: Brightness.light, // Use dark icons on status bar (for light backgrounds)
    //   ),
    //   leading: Icon(
    //     Icons.dashboard_outlined,
    //     color: Colors.white,
    //   ),
    //   centerTitle: true,
    //   title: Text(
    //     widget.title,
    //     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
    //       color: Colors.white,
    //       fontSize: 16.h,
    //     ),
    //   ),
    //   actions: [
    //     // Notification icon with badge
    //     Badge(
    //       backgroundColor: Theme.of(context).colorScheme.error,
    //       label: Text(
    //         '3',
    //         style: TextStyle(color: Theme.of(context).colorScheme.onError),
    //       ),
    //       alignment: Alignment.topRight,
    //       offset: Offset(-6.h, 6.h),
    //       child: IconButton(
    //         icon: Icon(
    //           Icons.notifications,
    //           color: Colors.white,
    //         ),
    //         onPressed: () {
    //           context.push('/${Routes.notification}');
    //         },
    //         tooltip: 'Notifications',
    //       ),
    //     ),
    //     IconButton(
    //       icon: Icon(
    //         Icons.more_vert,
    //         color: Colors.white,
    //       ),
    //       onPressed: () => _showPopupMenu(context),
    //       tooltip: 'More Options',
    //     ),
    //   ],
    //   iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSurface),
    // );

    return AppBar(
    );

  }
}
