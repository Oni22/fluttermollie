library molli;

export 'mollieaddress.dart';
export 'mollieorder.dart';
export 'mollieproduct.dart';
export 'mollieamount.dart';
export 'package:mollie/molliecheckout.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import 'mollieorder.dart';

class Mollie {

  static const MethodChannel _channel = const MethodChannel('mollie');

  /// Opens the browser to process the payment. Returns after payment is done.
  static Future<void> startPayment(String checkoutUrl) async {
    return await _channel
        .invokeMethod('startPayment', {"checkoutUrl": checkoutUrl});
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
  void clearCurrentOrder() => currentMollieOrder = null;

}
