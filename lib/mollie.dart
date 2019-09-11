library molli;

export 'mollieaddress.dart';
export 'mollieorder.dart';
export 'mollieproduct.dart';
export 'mollieamount.dart';
export 'package:mollie/molliecheckout.dart';
export 'mollieorderstatus.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import 'mollieorder.dart';

class Mollie {

  static final klarnaPayNow = "sofort";
  static final creditCard = "creditcard";
  static final payPal = "paypal";
  static final sepa = "sepa"; //TODO not working!

  static const MethodChannel _channel = const MethodChannel('mollie');

  /// Opens the browser to process the payment. Returns after payment is done.
  static Future<void> startPayment(String checkoutUrl) async {
    return await _channel
        .invokeMethod('startPayment', {"checkoutUrl": checkoutUrl});
  }

  /// Trys to open the browser to process the payment depending on the current order. Returns after payment is done.
  static Future<void> tryStartPayment() async {

    assert(currentMollieOrder == null && currentMollieOrder.method == null, "Current order is null or has no method");

    return await _channel
        .invokeMethod('startPayment', {"checkoutUrl": currentMollieOrder.checkoutUrl});

  }

  /// Creates a new order and returns a MollieOrderResponse.
  static Future<MollieOrderResponse> createOrder(String createOrderUrl, MollieOrderRequest order) async {

    String body = order.toJson();

    var res = await http.post(
      createOrderUrl,
      headers: {
        "Content-Type": "application/json"
      },
      body: body
    );

    dynamic data = json.decode(res.body);

    MollieOrderResponse r = new MollieOrderResponse.build(data);
    currentMollieOrder = r;

    return r;

  }

  /// The current order
  static MollieOrderResponse currentMollieOrder;

  /// Clears the currentMollieOrder
  static void clearCurrentOrder() => currentMollieOrder = null;

}
