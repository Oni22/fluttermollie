
import 'dart:convert';

import 'mollieproduct.dart';

class MollieShipmentProduct {

  String id;
  int quantity;

  MollieShipmentProduct({
    this.id,
    this.quantity
  });

  dynamic toMap(){
    return {
      "id": id,
      "quantity": quantity
    };
  }

}

class MollieShipmentRequest {

  String orderId;
  List<MollieShipmentProduct> products;
  String carrier;
  String trackingCode;
  String url;

  MollieShipmentRequest({
    this.orderId,
    this.carrier,
    this.products,
    this.trackingCode,
    this.url
});

  String toJson(){

    dynamic mappedProducts = products.map((p) => p.toMap()).toList();

    return json.encode({
      "orderId": orderId,
      "products": mappedProducts,
      "tracking": {
        "carrier": carrier,
        "code": trackingCode,
        "url": url
      }
    });
  }

}

class MollieShipmentResponse {

  String id;
  String orderId;
  String createdAt;
  String trackingCode;
  String carrier;
  String url;
  List<MollieProductResponse> products;
  String orderUrl;
  String selfUrl;
  String documentationUrl;

  MollieShipmentResponse.build(dynamic data){

    id = data["id"];
    orderId = data["orderId"];
    createdAt = data["createdAt"];
    trackingCode = data["tracking"]["code"];
    carrier = data["tracking"]["carrier"];
    url = data["tracking"]["url"];

    for(int i = 0; i < data["lines"].length; i++){

      products.add(MollieProductResponse.build(data["lines"][i]));

    }

    orderUrl = data["_links"]["order"]["href"];
    selfUrl = data["_links"]["self"]["href"];
    documentationUrl = data["_links"]["documentation"]["href"];


  }


}
