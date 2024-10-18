import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunshine_task/app_router/route_constants.dart';
import 'package:sunshine_task/screens/home_page.dart';
import 'package:sunshine_task/screens/rate_list.dart';
import 'package:sunshine_task/screens/sign_in.dart';
import 'package:sunshine_task/screens/sign_up.dart';
import 'package:sunshine_task/screens/discount_page.dart';
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
        // GoRoute(
        //   name: Routes.menu,
        //   path: '/${Routes.menu}',
        //   builder: (context, state) => const HomePage(),
        // ),
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
          name: Routes.orderDetail,
          path: '/${Routes.orderDetail}',
          builder: (context, state) => const OrderDetailScreen(),
        ),

        // GoRoute(
        //   name: Routes.rateList,
        //   path: '/${Routes.rateList}',
        //   builder: (context, state) => const RateList(),
        // ),

      ],
    ),
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
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);