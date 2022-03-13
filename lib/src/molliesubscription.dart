import 'dart:convert';
import 'package:mollie/src/mollieamount.dart';

class MollieSubscriptionRequest {
  MollieAmount amount;
  int times;
  String interval;
  String description;
  String webhookUrl;

  MollieSubscriptionRequest({this.amount, this.interval, this.description, this.webhookUrl, this.times});

  String toJson() {
    return json.encode({
      "amount": amount.toMap(),
      "times": times,
      "interval": interval,
      "description": description,
      "webhookUrl": webhookUrl,
    });
  }
}

class MollieSubscriptionResponse {
  String id;
  String mode;
  String createdAt;
  String status;
  MollieAmount amount;
  String value;
  int times;
  int timesRemaining;
  String interval;
  String description;
  String startDate;
  String nextPaymentDate;
  String method;
  String webhookUrl;
  String customerUrl;
  String documentationUrl;
  String profileUrl;
  String selfUrl;

  MollieSubscriptionResponse.build(dynamic data) {
    id = data["id"];
    mode = data["mode"];
    createdAt = data["createdAt"];
    status = data["status"];
    amount = MollieAmount(value: data["amount"]["value"], currency: data["amount"]["currency"]);
    value = data["value"];
    times = data["times"];
    timesRemaining = data["timesRemaining"];
    interval = data["interval"];
    description = data["description"];
    startDate = data["startDate"];
    nextPaymentDate = data["nextPaymentDate"];
    method = data["method"];
    webhookUrl = data["weebhookUrl"];
    customerUrl = data["_links"]["customer"]["href"];
    documentationUrl = data["_links"]["documentation"]["href"];
    profileUrl = data["_links"]["profile"]["href"];
    selfUrl = data["_links"]["self"]["href"];
  }
}
