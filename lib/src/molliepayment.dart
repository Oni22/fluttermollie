import 'dart:convert';
import 'package:mollie/src/mollieamount.dart';

class MolliePaymentRequest {
  MollieAmount amount;
  String description;
  String webhookUrl;
  String redirectUrl;
  dynamic metaData;

  MolliePaymentRequest(
      {this.amount,
      this.redirectUrl,
      this.description,
      this.webhookUrl,
      this.metaData});

  String toJson() {
    return json.encode({
      "amount": amount.toMap(),
      "redirectUrl": redirectUrl,
      "metadata": json.encode(metaData),
      "description": description,
      "webhookUrl": webhookUrl,
    });
  }
}

class MolliePaymentResponse {
  String id;
  String mode;
  String createdAt;
  String status;
  MollieAmount amount;
  bool isCancelable;
  String sequenceType;
  String details;
  String profileId;
  String description;
  String method;
  dynamic metaData;
  String webhookUrl;
  String customerUrl;
  String redirectUrl;
  String checkoutUrl;
  String documentationUrl;
  String selfUrl;

  MolliePaymentResponse.build(dynamic data) {
    id = data["id"];
    mode = data["mode"];
    isCancelable = data["isCancelable"];
    createdAt = data["createdAt"];
    status = data["status"];
    amount = MollieAmount(
        value: data["amount"]["value"], currency: data["amount"]["currency"]);
    details = data["details"];
    sequenceType = data["sequenceType"];
    metaData = data["metaData"];
    description = data["description"];
    redirectUrl = data["redirectUrl"];
    method = data["method"];
    webhookUrl = data["weebhookUrl"];

    if (data["_links"].containsKey("checkout"))
      checkoutUrl = data["_links"]["checkout"]["href"];

    if (data["_links"].containsKey("documentation"))
      documentationUrl = data["_links"]["documentation"]["href"];

    selfUrl = data["_links"]["self"]["href"];
  }
}
