import 'package:flutter/material.dart';

class settingPrivacyCommon
{
  static greyText({required String name})
  {
    return Text(name, style: TextStyle(color:Color(0xffB2AFAF),fontWeight: FontWeight.w500,fontSize: 16));
  }
  static blackText({required String name})
  {
    return Text(name, style: TextStyle(color:Color(0xff000000),fontWeight: FontWeight.w500,fontSize: 18));
  }


}