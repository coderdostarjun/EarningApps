import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Callback onPressed;
  final Color? color;
  final Color? textcolor;
  const CommonButton(
      {super.key, required this.text, required this.onPressed, this.color, this.textcolor, });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            // width: 357,
            width: MediaQuery.of(context).size.width/1.2,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color ?? Color(0xffFFFFFF),
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color:textcolor?? Color(0xff000000)),
            )),
          ),
        )
      ],
    );
  }
}
