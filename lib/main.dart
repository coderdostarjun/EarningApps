import 'package:earning_app/Controllers/setting_privacy/setting_privacy_controller.dart';
import 'package:earning_app/Screens/earning_summary/earning_summary_screen.dart';
import 'package:earning_app/Screens/setting_privacy/setting_privacy_screen.dart';
import 'package:earning_app/Services/key_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=publishable_key;
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EarningSummaryScreen(),
    );
  }
}



