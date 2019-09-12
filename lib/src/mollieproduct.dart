import 'package:mollie/src/mollieamount.dart';

class MollieProductRequest {
  String type;
  String sku;
  String name;
  String productUrl;
  String imageUrl;
  int quantity;
  String vatRate;
  MollieAmount unitPrice;
  MollieAmount totalAmount;
  MollieAmount discountAmount;
  MollieAmount vatAmount;

  MollieProductRequest(
      {this.type,
      this.sku,
      this.name,
      this.productUrl,
      this.imageUrl,
      this.quantity,
      this.vatRate,
      this.unitPrice,
      this.totalAmount,
      this.discountAmount,
      this.vatAmount});

  dynamic toMap() {
    return {
      "type": type,
      "sku": sku,
      "name": name,
      "productUrl": productUrl,
      "imageUrl": imageUrl,
      "quantity": quantity,
      "vatRate": vatRate,
      "unitPrice": unitPrice.toMap(),
      "totalAmount": totalAmount.toMap(),
      "discountAmount": discountAmount.toMap(),
      "vatAmount": vatAmount.toMap(),
    };
  }
}

class MollieProductResponse {
  String id;
  String orderId;
  String type;
  String sku;
  String name;
  String productUrl;
  String imageUrl;
  int quantity;
  String vatRate;
  MollieAmount unitPrice;
  MollieAmount totalAmount;
  MollieAmount discountAmount;
  MollieAmount vatAmount;

  MollieProductResponse.build(dynamic data) {
    id = data["id"];
    orderId = data["orderId"];
    type = data["type"];
    sku = data["sku"];
    name = data["name"];
    productUrl = data["_links"]["productUrl"]["href"];
    imageUrl = data["_links"]["imageUrl"]["href"];
    quantity = data["quantity"];
    vatRate = data["vatRate"];

    unitPrice = new MollieAmount(
        value: data["unitPrice"]["value"],
        currency: data["unitPrice"]["currency"]);

    totalAmount = new MollieAmount(
        value: data["totalAmount"]["value"],
        currency: data["totalAmount"]["currency"]);

    discountAmount = new MollieAmount(
        value: data["discountAmount"]["value"],
        currency: data["discountAmount"]["currency"]);

    vatAmount = new MollieAmount(
        value: data["vatAmount"]["value"],
        currency: data["vatAmount"]["currency"]);
  }
}
