import 'package:earning_app/Common%20Componets/common_button.dart';
import 'package:earning_app/Common%20Componets/common_style.dart';
import 'package:earning_app/Controllers/earning_summary/earning_summary_controller.dart';
import 'package:earning_app/Screens/earning_summary/widgets/earning_summary_common_widget.dart';
import 'package:earning_app/Screens/setting_privacy/setting_privacy_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EarningSummaryScreen extends StatelessWidget {
  //normal object create garda var obj_name=classname()
  //but we create object using getx so ekchoti object create garesi yesko instance jaha pani jati choti pani use garna melxa
  var earningController = Get.put(EarningSummaryController());

  EarningSummaryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        // color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 55.0,
            ),
            //createe heading of earning summary
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Earning Summary",
                    style: CommonStyle.HeadLineTextFieldStyle()),
              ],
            ),

            //create moneytrack
            Container(
                margin: EdgeInsets.only(top: 8.0, left: 24),
                width: 360,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    //obx le listner ko rupma kama garxa if kunai change vako thapaya change dekhauxa value ma yeha chai
                    Obx(
                      () => EarningSummaryCommonWidget.moneyTrackRow(
                          icon: Icons.check_circle,
                          iconColor: Color(0xff0C7648),
                          text: "Paid Today :",
                          value: earningController.paidToday.value),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Obx(
                      () => EarningSummaryCommonWidget.moneyTrackRow(
                          icon: Icons.calendar_today,
                          text: "Total This Week :",
                          value: earningController.weekTotalAmount.value),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Obx(
                      () => EarningSummaryCommonWidget.moneyTrackRow(
                          icon: Icons.access_time,
                          text: "LifeTime Earnings :",
                          value: earningController.lifetimeEarning.value),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 24),
                child: Text(
                  "Preferred Contact Method",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),

            //create job table
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(right: 28.0, left: 24),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  // Table Header
                  Container(
                    // color:Color(0xffA8B1BE),
                    child: Row(
                      children: [
                        Text('Job ID',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 72,
                        ),
                        Text('Date',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 72,
                        ),
                        Text('Status',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(height: 1, color: Colors.grey),
                  const SizedBox(height: 10),

                  // Row 1
                  Obx(
                    () => EarningSummaryCommonWidget.jobRow(
                        earningController.contacts[0]["jobId"],
                        earningController.contacts[0]["date"],
                        earningController.contacts[0]["status"]),
                  ),
                  Container(height: 1, color: Colors.grey),
                  const SizedBox(height: 10),

                  // Row 2
                  Obx(
                    () => EarningSummaryCommonWidget.jobRow(
                        earningController.contacts[1]["jobId"],
                        earningController.contacts[1]["date"],
                        earningController.contacts[1]["status"]),
                  ),
                  Container(height: 1, color: Colors.grey),
                  const SizedBox(height: 10),

                  // Row 3
                  Obx(() => EarningSummaryCommonWidget.jobRow(
                      earningController.contacts[2]["jobId"],
                      earningController.contacts[2]["date"],
                      earningController.contacts[2]["status"])),
                ],
              ),
            ),

            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(right: 28.0, left: 24),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("All jobs are paid immediately upon completion via your linked payout method.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
            ),

            //all buttons
            SizedBox(height: 18),
            CommonButton(text: 'Update Payment Method', onPressed: () {Get.to(()=>SettingPrivacyScreen());}),
            const SizedBox(height: 18),
            CommonButton(text: 'View Job History', onPressed: () {}),
            const SizedBox(height: 18),
            CommonButton(text: 'Contact Support', onPressed: () {}),
          ],
        ),
      ),
    ));
  }
}
