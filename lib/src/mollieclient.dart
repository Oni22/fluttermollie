
import 'mollieshipment.dart';
import 'molliesubscription.dart';
import 'molliecustomer.dart';
import 'mollieorder.dart';
import 'package:mollie/internal/orderhandler.dart';

class MollieClient {

  String _apiKey;
  var headers;

  OrderHandler orders;

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

  }



}