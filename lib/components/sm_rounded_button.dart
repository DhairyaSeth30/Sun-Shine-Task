import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmRoundedButton extends StatelessWidget {
  const SmRoundedButton({
    // required this.colour,
    required this.title,
    required this.onPressed,
    // this.border,
    // required this.textColor,
  });
  //
  // final Color colour;
  final String title;
  final Function onPressed;
  // final Color? border;
  // final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 51.0,
        decoration: BoxDecoration(
          color: Colors.white,
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
                fontSize: 19.sp,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
              color: Color.fromRGBO(59, 49, 158, 1)
            ),
          ),
        ),
      ),
    );
  }
}
