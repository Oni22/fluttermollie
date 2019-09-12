library molli;

export 'package:mollie/src/mollieaddress.dart';
export 'package:mollie/src/mollieorder.dart';
export 'package:mollie/src/mollieproduct.dart';
export 'package:mollie/src/mollieamount.dart';
export 'package:mollie/src/molliecheckout.dart';
export 'package:mollie/src/mollieorderstatus.dart';
export 'package:mollie/src/molliecustomer.dart';
export 'package:mollie/src/molliesubscription.dart';
export 'package:mollie/src/mollieshipment.dart';

import 'package:mollie/src/mollieorder.dart';
import 'dart:async';
import 'package:flutter/services.dart';

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

  static MollieOrderResponse _currentOrder;

  static MollieOrderResponse getCurrentOrder() => _currentOrder;

  static MollieOrderResponse setCurrentOrder(MollieOrderResponse order) =>
      _currentOrder = order;
}
