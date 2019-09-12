import 'package:mollie/mollieaddress.dart';
import 'package:mollie/mollieamount.dart';
import 'package:mollie/mollieproduct.dart';
import 'dart:convert';

class MollieOrderRequest {
  MollieAmount amount;
  MollieAddress shippingAddress;
  MollieAddress billingAddress;
  dynamic metaData;
  String consumerDateOfBirth;
  String locale;
  String redirectUrl;
  String webhookUrl;
  List<MollieProductRequest> products;
  String method;
  String orderNumber;

  MollieOrderRequest(
      {this.amount,
      this.billingAddress,
      this.shippingAddress,
      this.metaData,
      this.consumerDateOfBirth,
      this.locale,
      this.webhookUrl,
      this.redirectUrl,
      this.products,
      this.method,
      this.orderNumber});

  dynamic toJson() {
    List<dynamic> productMaps = [];

    for (MollieProductRequest p in products) {
      print(p.toMap());
      productMaps.add(p.toMap());
    }

    return json.encode({
      "amount": amount.toMap(),
      "billingAddress": billingAddress.toMap(),
      "shippingAddress": shippingAddress.toMap(),
      //"metaData": metaData,
      "consumerDateOfBirth": consumerDateOfBirth,
      "locale": locale,
      "redirectUrl": redirectUrl,
      "webhookUrl": webhookUrl,
      "orderNumber": orderNumber,
      "method": method,
      "lines": productMaps
    });
  }
}

class MollieOrderResponse {
  String id;
  MollieAmount amount;
  MollieAddress shippingAddress;
  MollieAddress billingAddress;
  dynamic metaData;
  String consumerDateOfBirth;
  String locale;
  String redirectUrl;
  String webhookUrl;
  String checkoutUrl;
  List<MollieProductResponse> products = new List();
  String status;
  String method;
  String orderNumber;
  String createdAt;
  String expiresAt;

  MollieOrderResponse.build(dynamic data) {
    id = data["id"];

    amount = MollieAmount(
        currency: data["amount"]["currency"], value: data["amount"]["value"]);

    shippingAddress = MollieAddress.build(data["shippingAddress"]);
    billingAddress = MollieAddress.build(data["billingAddress"]);

    createdAt = data["createdAt"];
    expiresAt = data["expiredAt"];

    metaData = data["metaData"];

    consumerDateOfBirth = data["consumerDateOfBirth"];
    locale = data["locale"];

    redirectUrl = data["redirectUrl"];
    webhookUrl = data["webhookUrl"];

    for (int i = 0; i < data["lines"].length; i++) {
      products.add(new MollieProductResponse.build(data["lines"][i]));
    }

    status = data["status"];
    method = data["method"];
    orderNumber = data["orderNumber"];

    checkoutUrl = data["_links"]["checkout"]["href"];
  }

  String getMethodFormatted() {
    switch (method) {
      case "paypal":
        return "PayPal";
      case "creditcard":
        return "Credit Card";
      case "sofort":
        return "Sofort";
      default:
        return "No method selected";
    }
  }
}
