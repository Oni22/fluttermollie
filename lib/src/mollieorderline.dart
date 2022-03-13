import 'dart:convert';

class MollieOrderLine {
  String orderId;
  String orderLineId;
  String name;
  String productUrl;
  String imageUrl;

  MollieOrderLine({this.orderId, this.orderLineId, this.name, this.imageUrl, this.productUrl});

  String toJson() {
    return json.encode({"name": name, "productUrl": productUrl, "imageUrl": imageUrl});
  }
}
