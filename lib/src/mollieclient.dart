import 'package:mollie/internal/invoicehandler.dart';
import 'package:mollie/internal/orderhandler.dart';
import 'package:mollie/internal/customerhandler.dart';
import 'package:mollie/internal/subscriptionhandler.dart';
import 'package:mollie/internal/paymenthandler.dart';

class MollieClient {
  String _apiKey;
  var headers;

  OrderHandler orders;
  CustomerHandler customers;
  SubscriptionHandler subscription;
  PaymentHandler payments;
  InvoiceHandler invoiceHandler;

  static final MollieClient _instance = MollieClient._internal();

  factory MollieClient() => _instance;

  MollieClient._internal();

  /// Sets the api key
  void init(String apiKey) {
    _apiKey = apiKey;

    headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + apiKey,
    };

    orders = OrderHandler(headers);
    customers = CustomerHandler(headers);
    subscription = SubscriptionHandler(headers);
    payments = PaymentHandler(headers);
    invoiceHandler = InvoiceHandler(headers);
  }
}
