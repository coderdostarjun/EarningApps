import 'package:earning_app/Common%20Componets/common_button.dart';
import 'package:earning_app/Controllers/setting_privacy/setting_privacy_controller.dart';
import 'package:earning_app/Screens/setting_privacy/widgets/setting_privacy_common.dart';
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
          settingPrivacyCommon.greyText(name: "PROFILE INFO"),
          SizedBox(height: 16),
            Obx(()=>settingPrivacyCommon.blackText(name:settingController.name.value)),
         SizedBox(height: 16,),
          Container(
            height: 1.5,
            color: Color(0xffDFD8D8),
          ),
            SizedBox(height: 16),
            Obx(()=>settingPrivacyCommon.blackText(name:settingController.name.value)),
            SizedBox(height: 12,),
            Obx(()=>settingPrivacyCommon.greyText(name:settingController.email.value),),
            SizedBox(height: 16),
            Container(
              height: 1.5,
              color: Color(0xffDFD8D8),
            ),
            SizedBox(height: 16,),
            settingPrivacyCommon.blackText(name:"Phone Number"),
            SizedBox(height: 12,),
            Obx(()=>settingPrivacyCommon.greyText(name:settingController.phone.value),),
            SizedBox(height: 35,),
            settingPrivacyCommon.greyText(name:"PAYOUT INFO"),
            SizedBox(height: 16,),
            settingPrivacyCommon.blackText(name:"Linked Payout Method"),
            SizedBox(height: 12,),
            settingPrivacyCommon.blackText(name:"....1234"),
            SizedBox(height: 24,),
            CommonButton(text: "Link or Update Bank / Debit Card", onPressed: (){},color: Color(0xff0C7648),textcolor: Colors.white,),
            SizedBox(height: 40,),
            Text("SUPPORT",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff5E5A5A)),),
            SizedBox(height: 20,),
            Container(
              height: 46,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF)
              ),
              width: MediaQuery.of(context).size.width,
              child: Text("Account"),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Get.back();
              },
                child: Center(child: Text("Log Out",style: TextStyle(color:Color(0xffDB1010),fontSize: 24,fontWeight: FontWeight.w700 ),)))
          ],
        ),
      ),
    );
  }
}
