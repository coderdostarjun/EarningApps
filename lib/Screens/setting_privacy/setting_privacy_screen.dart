import 'dart:developer';

import 'package:earning_app/Common%20Componets/common_button.dart';
import 'package:earning_app/Controllers/setting_privacy/setting_privacy_controller.dart';
import 'package:earning_app/Screens/setting_privacy/widgets/setting_privacy_common.dart';
import 'package:earning_app/Services/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
class SettingPrivacyScreen extends StatefulWidget {
  SettingPrivacyScreen({super.key});

  @override
  State<SettingPrivacyScreen> createState() => _SettingPrivacyScreenState();
}

class _SettingPrivacyScreenState extends State<SettingPrivacyScreen> {
  var settingController = Get.put(SettingPrivacyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Setting & Privacy",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        )),
        leading: const BackButton(),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.0,
              ),
              settingPrivacyCommon.greyText(name: "PROFILE INFO"),
              SizedBox(height: 16),
              Obx(() => settingPrivacyCommon.blackText(
                  name: settingController.name.value)),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 1.5,
                color: Color(0xffDFD8D8),
              ),
              SizedBox(height: 16),
              Obx(() => settingPrivacyCommon.blackText(
                  name: settingController.name.value)),
              SizedBox(
                height: 12,
              ),
              Obx(
                () => settingPrivacyCommon.greyText(
                    name: settingController.email.value),
              ),
              SizedBox(height: 16),
              Container(
                height: 1.5,
                color: Color(0xffDFD8D8),
              ),
              SizedBox(
                height: 16,
              ),
              settingPrivacyCommon.blackText(name: "Phone Number"),
              SizedBox(
                height: 12,
              ),
              Obx(
                () => settingPrivacyCommon.greyText(
                    name: settingController.phone.value),
              ),
              SizedBox(
                height: 35,
              ),
              settingPrivacyCommon.greyText(name: "PAYOUT INFO"),
              SizedBox(
                height: 16,
              ),
              settingPrivacyCommon.blackText(name: "Linked Payout Method"),
              SizedBox(
                height: 12,
              ),
              settingPrivacyCommon.blackText(name: "....1234"),
              SizedBox(
                height: 24,
              ),
              Obx(()=>Center(child: Text("Amount:"+settingController.amountDisplay.value.toString(),style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,color: Colors.cyanAccent),))),
              SizedBox(
                height: 24,
              ),
              CommonButton(
                text: "Link or Update Bank / Debit Card",
                onPressed: () async {
                 showAmountInputDialog();
                },
                color: Color(0xff0C7648),
                textcolor: Colors.white,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "SUPPORT",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff5E5A5A)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 46,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(color: Color(0xffFFFFFF)),
                width: MediaQuery.of(context).size.width,
                child: Text("Account"),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Center(
                      child: Text(
                    "Log Out",
                    style: TextStyle(
                        color: Color(0xffDB1010),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  )))
            ],
          ),
        ),
      ),
    );
  }

  //payment integration implementation
  Map<String, dynamic>? paymentIntent;
  //creating obj of paymentservice for access methods
  PaymentService paymentService = PaymentService();
  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await paymentService.createPaymentIntent(amount, "USD");
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              customFlow: true,
              merchantDisplayName: 'Earning_app',
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              style: ThemeMode.dark,
              googlePay: const PaymentSheetGooglePay(
                merchantCountryCode: 'US',
                currencyCode: 'USD',
                testEnv: true,
              )));
      await displayPaymentSheet(amount);
    } catch (e) {
      log(e.toString());
    }
  }

  displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then(
        (value) async {
          //to display amount
          settingController.amountDisplay.value += int.parse(amount);
          // On successful payment, show success message using Snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("\nAmount:\$$amount added Successfully on Wallet"),
                backgroundColor: Colors.green,
              ),
            );
        },
      );
      paymentIntent = null;
    } on StripeException catch (e) {
      log(e.toString());
      // Handle error (failed payment)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Payment Failed\nPlease try again."),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      log(e.toString());
      // Handle any other exception
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Payment Failed\nPlease try again."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  //this design part was created using chatgpt:
  void showAmountInputDialog() {
    TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Amount to Add'),
          content: TextField(
            controller: amountController,
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                String amount = amountController.text.trim();

                if (amount.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter an amount.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                Navigator.of(context).pop(); // Close the dialog
                await makePayment(amount); // Proceed to payment
              },
              child: Text('Proceed to Pay'),
            ),
          ],
        );
      },
    );
  }
}
