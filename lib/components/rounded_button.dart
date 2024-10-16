import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.title,
    required this.onPressed,
    required this.textColor,
  });

  final String title;
  final Function? onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                border: Border.all(
                  color: Color.fromRGBO(101, 24, 152, 1),
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 21.sp,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                    color: textColor
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
