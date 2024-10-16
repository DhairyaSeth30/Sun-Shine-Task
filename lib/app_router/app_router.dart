import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunshine_task/app_router/route_constants.dart';
import 'package:sunshine_task/screens/home_page.dart';
import 'package:sunshine_task/screens/rate_list.dart';
import 'package:sunshine_task/screens/sign_in.dart';
import 'package:sunshine_task/screens/sign_up.dart';
import 'package:sunshine_task/screens/widget/discount_page.dart';
import '../screens/calender_page.dart';
import '../screens/confirm_product.dart';
import '../screens/main_screen.dart';
import '../screens/order_page.dart';
import '../screens/payment_method_page.dart';
import '../screens/product.dart';

final router = GoRouter(
  // initialLocation: Routes.home,
  initialLocation: '/${Routes.signIn}',
  routes: [
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      pageBuilder: (context, state, child) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: MainPage(child: child),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.fastLinearToSlowEaseIn; // Apply a smoother curve
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 200), // Adjust duration
        );
      },
      routes: [
        GoRoute(
          name: Routes.menu,
          path: '/${Routes.menu}',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          name: Routes.home,
          path: Routes.home,
          builder: (context, state) => const HomePage(),
        ),
        // GoRoute(
        //   name: Routes.calendar,
        //   path: '/${Routes.calendar}',
        //   builder: (context, state) => DateCarousel(),
        // ),
        GoRoute(
          name: Routes.leaveTracker,
          path: '/${Routes.leaveTracker}',
          builder: (context, state) => const OrderDetailScreen(),
        ),

        GoRoute(
          name: Routes.rateList,
          path: '/${Routes.rateList}',
          builder: (context, state) => const RateList(),
        ),

        // nesting of routes
        // GoRoute(
        //   name: Routes.leaveTracker,
        //   path: '/${Routes.leaveTracker}',
        //   builder: (context, state) => const LeaveTrackerScreen(),
        //   routes: <RouteBase>[
        //     GoRoute(
        //       name: Routes.leaveDetail,
        //       path: Routes.leaveDetail,
        //       builder: (context, state) {
        //         final leaveApplication = state.extra as LeaveApplication;
        //         return LeaveApplicationDetailScreen(leaveApplication: leaveApplication);
        //       },
        //     ),
        //
        //     GoRoute(
        //       name: Routes.allLeaves, // Define a name for this route
        //       path: Routes.allLeaves, // Sub-path for all leaves
        //       builder: (context, state) {
        //         final value = state.extra as bool;
        //         return AllLeavesScreen(isUserLeaves: value);
        //       },
        //
        //     ),
        //     GoRoute(
        //       name: Routes.applyLeave,
        //       path: Routes.applyLeave,
        //       builder: (context, state) {
        //         final balance = state.extra as LeaveBalanceOpening;
        //         return ApplyLeaveForm(leaveBalanceOpening: balance);
        //       },
        //     ),
        //   ],
        // ),
        // GoRoute(
        //   name: Routes.tourTracker,
        //   path: '/${Routes.tourTracker}',
        //   builder: (context, state) => const TourTrackerScreen(),
        //   routes: <RouteBase>[
        //     GoRoute(
        //       name: Routes.tourDetail,
        //       path: Routes.tourDetail,
        //       builder: (context, state) {
        //         final userTour = state.extra as UserTour;
        //         return UserTourDetailScreen(userTour: userTour);
        //       },
        //     ),
        //     GoRoute(
        //       name: Routes.allTours, // Define a name for this route
        //       path: Routes.allTours, // Sub-path for all leaves
        //       builder: (context, state) {
        //         final value = state.extra as bool;
        //         return AllTourList(isUserLeaves: value);
        //       },
        //     ),
        //   ],
        // ),
      ],
    ),
    // GoRoute(
    //   name: Routes.applyTour,
    //   path: '/${Routes.applyTour}',
    //   builder: (context, state) {
    //     final userTour = state.extra as UserTour?;
    //     return UserTourForm(userTour: userTour);
    //   },
    //   onExit: (context, state) {
    //
    //     return true;
    //   },
    // ),
    GoRoute(
      name: Routes.selectionScreen,
      path: '/${Routes.selectionScreen}',
      builder: (context, state) => SelectionScreen(),
    ),
    GoRoute(
      name: Routes.confirmProduct,
      path: '/${Routes.confirmProduct}',
      builder: (context, state) => const ConfirmProduct(),
    ),
    GoRoute(
      name: Routes.discountScreen,
      path: '/${Routes.discountScreen}',
      builder: (context, state) => DiscountScreen(),
    ),
    GoRoute(
      name: Routes.calenderPage,
      path: '/${Routes.calenderPage}',
      builder: (context, state) => DateCarousel(),
    ),
    GoRoute(
      name: Routes.paymentMethodPage,
      path: '/${Routes.paymentMethodPage}',
      builder: (context, state) => const PaymentMethodPage(),
    ),
    GoRoute(
      name: Routes.signIn,
      path: '/${Routes.signIn}',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      name: Routes.signUp,
      path: '/${Routes.signUp}',
      builder: (context, state) => SignUpScreen(),
    ),
    // GoRoute(
    //   name: Routes.loginScreen,
    //   path: '/${Routes.loginScreen}',
    //   builder: (context, state) => const LoginScreen(),
    // ),
    // GoRoute(
    //   name: 'notification',
    //   path: '/notifications',
    //   onExit: (context, state) {
    //     return true;
    //   },
    //   redirect: (context, state) {
    //     return null;
    //   },
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       child: NotificationPage(),
    //       transitionDuration: Duration(milliseconds: 300),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         const begin = Offset(1.0, 0.0); // Slide in from the right
    //         const end = Offset.zero;
    //         const curve = Curves.easeInOut;
    //         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    //         var offsetAnimation = animation.drive(tween);
    //         return SlideTransition(
    //           position: offsetAnimation,
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    // ),
  ],
);
