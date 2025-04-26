import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../Common Componets/common_style.dart';

class EarningSummaryCommonWidget {
  static moneyTrackRow(
      {required IconData icon,
      Color? iconColor,
      required String text,
      required double value}) {
    return Row(
      children: [
        Icon(icon,
            size: 22, color: iconColor != null ? iconColor : Colors.black),
        SizedBox(
          width: 6,
        ),
        Text(text, style: CommonStyle.NormalHeadingStyle1()),
        Spacer(),
        Text(
          "\$$value",
          style: CommonStyle.NormalHeadingStyle1(),
        ),
      ],
    );
  }

  static jobRow(String jobId, String date, String status) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(jobId),
          Text(date),
          Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 18),
              const SizedBox(width: 5),
              Text(status),
            ],
          ),
        ],
      ),
    );
  }
}
