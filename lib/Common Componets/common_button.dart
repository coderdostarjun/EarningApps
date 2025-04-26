import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  const CommonButton(
      {super.key, required this.text,  required this.onPressed, this.color,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 357,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000)),
          )),
        )
      ],
    );
  }
}
