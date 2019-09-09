
class MollieAddress {

  String organizationName;
  String streetAndNumber;
  String city;
  String region;
  String postalCode;
  String country;
  String title;
  String givenName;
  String familyName;
  String email;
  String phone;

  MollieAddress({
    this.organizationName,
    this.streetAndNumber,
    this.city,
    this.region,
    this.postalCode,
    this.country,
    this.title,
    this.givenName,
    this.familyName,
    this.email,
    this.phone
  });

  dynamic toMap(){
    return {
      "organizationName": organizationName,
      "streetAndNumber": streetAndNumber,
      "city": city,
      "region": region,
      "postalCode": postalCode,
      "country": country,
      "title": title,
      "givenName": givenName,
      "familyName": familyName,
      "email": email,
      "phone": phone
    };
  }

  MollieAddress.build(dynamic data){

    organizationName = data["organizationName"];
    streetAndNumber = data["streetAndNumber"];
    city = data["city"];
    region = data["region"];
    postalCode = data["postalCode"];
    country = data["country"];
    title = data["title"];
    givenName = data["givenName"];
    familyName = data["familyName"];
    email = data["email"];
    phone = data["phone"];

  }

}