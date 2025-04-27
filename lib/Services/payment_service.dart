import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'key_constants.dart';

class PaymentService {
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'currency': currency,
        // Convert amount to cents (or the smallest unit)
        'amount':
            ((int.parse(amount) * 100)).toString(), // Convert dollars to cents
        'payment_method_types[]': 'card'
      };

      //api lai hit gareko
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer $secret_key',
            'Content-Type': 'application/x-www-form-urlencoded'
          });

      //ayeko response lai return gareko
      return jsonDecode(response.body);
    } catch (e) {
      log(e.toString());
    }
  }

}
