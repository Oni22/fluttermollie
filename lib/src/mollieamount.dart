class MollieAmount {
  MollieAmount({this.currency, this.value});

  String value;
  String currency;

  dynamic toMap() {
    return {"value": value, "currency": currency};
  }
}
