import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sunshine_task/bottombar/bottom_bar_state.dart';
import '../../app_router/route_constants.dart';
import '../bottombar/app_bar.dart';
import '../bottombar/bottom_nav_items.dart';


class MainPage extends ConsumerStatefulWidget {
  final Widget child;

  MainPage({Key? key, required this.child}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return _buildSuccessState(context);
  }

  Widget _buildSuccessState(BuildContext context) {
    final bottomProvider = ref.watch(bottomNavProvider);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: kBottomNavigationBarHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(101, 24, 152, 1), Color.fromRGBO(44, 13, 143, 1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Wrap BottomNavigationBar in a Theme widget to ensure no theme colors interfere
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent, // Ensures no background color is applied
            ),
            child: BottomNavigationBar(
              items: bottomNavItems(context),
              currentIndex: bottomProvider.currentIndex,
              onTap: (index) {
                _onItemTapped(index);
              },
              elevation: 0.0,
              showUnselectedLabels: true,
              enableFeedback: true,
              backgroundColor: Colors.transparent, // Make BottomNavigationBar transparent
              selectedItemColor: Colors.white, // Full white for selected item
              unselectedItemColor: Colors.white54, // White with 54% opacity for unselected item
              unselectedFontSize: 14.0,
              mouseCursor: SystemMouseCursors.click,
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    BottomNavigationBarItem item = bottomNavItems(context)[index];
    ref.read(bottomNavProvider.notifier).setIndex(index, item.label);
    switch (index) {
      case 0:
        context.go('/${Routes.home}');
        break;
      case 1:
        context.push('/${Routes.rateList}');
        break;
      case 2:
        context.go('/${Routes.orderDetail}');
        break;
      case 3:
        context.push('/${Routes.profile}');
        break;
    }
  }
}

