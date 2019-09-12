
import 'dart:convert';

class MollieCustomer {

  String resource;
  String id;
  String mode;
  String name;
  String email;
  String locale;
  dynamic metaData;
  String createdAt;
  String selfUrl;
  String documentationUrl;

  MollieCustomer({
    this.resource,
    this.id,
    this.mode,
    this.name,
    this.email,
    this.locale,
    this.metaData,
    this.createdAt,
    this.selfUrl,
    this.documentationUrl
  });

  String toJson(){

    return json.encode({
      "resource": "customer",
      "id": id,
      "mode": mode,
      "name": name,
      "email": email,
      "locale": locale,
      "metadata": metaData,
      "createdAt": createdAt,
      "_links": {
        "self": {
          "href": selfUrl,
          "type": "application/hal+json"
          }
          },
        "documentation": {
          "href": documentationUrl,
          "type": "text/html"
        }

    });

  }

  MollieCustomer.build(dynamic data){

    id = data["id"];
    mode = data["mode"];
    name = data["name"];
    email = data["email"];
    locale = data["locale"];
    metaData = data["metadata"];
    createdAt = data["createdAt"];
    selfUrl = data["_links"]["self"]["href"];
    documentationUrl = data["_links"]["documentations"]["href"];

  }
}