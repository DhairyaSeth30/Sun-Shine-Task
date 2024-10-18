import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBox extends StatelessWidget {

  final Function? onPressed;
  final String img;
  final Color color;
  final String text;

  CategoryBox({
    required this.onPressed,
    required this.img,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onPressed!();
          },
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: [
                // Positioned Image with gap from all sides
                Positioned(
                  top: 10.0,
                  bottom: 10.0,
                  left: 22.0,
                  right: 22.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10.0),
                    child: Image.asset(
                      img,
                      fit: BoxFit
                          .cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(59, 49, 158, 1),
          ),
        )
      ],
    );
  }
}
