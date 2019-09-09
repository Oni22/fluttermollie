library molli;
export 'mollieaddress.dart';
export 'mollieorder.dart';
export 'mollieproduct.dart';
export 'mollieamount.dart';

import 'dart:async';
import 'package:flutter/services.dart';

import 'mollieorder.dart';

class Mollie {

  static const MethodChannel _channel = const MethodChannel('mollie');

  /// Opens the browser to process the payment. Returns after payment is done.
  static Future<void> startPayment(String checkoutUrl) async {

    return await _channel.invokeMethod('startPayment',{
      "checkoutUrl": checkoutUrl
    });
  }


}
