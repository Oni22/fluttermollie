import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mollie/src/molliesubscription.dart';

/// TODO: https://stackoverflow.com/questions/52073350/php-mollie-payments-recurring-billing

class SubscriptionHandler {

  final String _apiEndpoint = "https://api.mollie.com/v2/customers";

  dynamic _headers;

  SubscriptionHandler(dynamic headers){
    _headers = headers;
  }

  /// With subscriptions, you can schedule recurring payments to take place at regular intervals.
  /// For example, by simply specifying an amount and an interval, you can create an endless subscription to charge a monthly fee, until you cancel the subscription.
  /// Or, you could use the times parameter to only charge a limited number of times, for example to split a big transaction in multiple parts.
  Future<MollieSubscriptionResponse> create(MollieSubscriptionRequest sub,String customerId) async{

    var res = await http.post(
        _apiEndpoint + "/" + customerId + "/subscriptions",
        headers: _headers,
        body: sub.toJson()
    );

    dynamic data = json.decode(res.body);

    return MollieSubscriptionResponse.build(data);

  }

  /// Retrieve a subscription by its ID and its customer’s ID.
  Future<MollieSubscriptionResponse> get(String customerId,String subId) async{

    var res = await http.get(
        _apiEndpoint + "/" + customerId + "/subscriptions/" + subId,
        headers: _headers,
    );

    dynamic data = json.decode(res.body);

    return MollieSubscriptionResponse.build(data);

  }

  /// A subscription can be canceled any time by calling DELETE on the resource endpoint.
  Future<MollieSubscriptionResponse> cancel(String customerId,String subId) async{

    var res = await http.delete(
      _apiEndpoint + "/" + customerId + "/subscriptions/" + subId,
      headers: _headers,
    );

    dynamic data = json.decode(res.body);

    return MollieSubscriptionResponse.build(data);

  }

  /// Some fields of a subscription can be updated by calling PATCH on the resource endpoint. Each field is optional.
  /// You cannot update a canceled subscription.
  Future<MollieSubscriptionResponse> update(MollieSubscriptionRequest sub,String subId,String customerId) async{

    var res = await http.patch(
      _apiEndpoint + "/" + customerId + "/subscriptions/" + subId,
      headers: _headers,
      body: sub.toJson()
    );

    dynamic data = json.decode(res.body);

    return MollieSubscriptionResponse.build(data);

  }

  /// Retrieve all subscriptions of a customer.
  Future<List<MollieSubscriptionResponse>> listSubscriptions(String customerId) async{

    var res = await http.get(
        _apiEndpoint + "/" + customerId + "/subscriptions",
        headers: _headers,
    );

    List<MollieSubscriptionResponse> subs = new List();

    dynamic data = json.decode(res.body);

    for(int i = 0; i < data["count"]; i++){
      subs.add(MollieSubscriptionResponse.build(data["_embedded"]["subscriptions"][i]));
    }

    return subs;

  }

}

