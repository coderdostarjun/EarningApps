import 'package:earning_app/Controllers/setting_privacy/setting_privacy_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class SettingPrivacyScreen extends StatelessWidget {
  var settingController = Get.put(SettingPrivacyController());

 SettingPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Setting & Privacy",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
        leading: const BackButton(),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.0,),
          Text('PROFILE INFO', style: TextStyle(color:Color(0xffB2AFAF),fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
            Obx(() => ListTile(
              title: Text(settingController.name.value),
              subtitle: Text(settingController.email.value),
            )),
          ],
        ),
      ),
    );
  }
}
