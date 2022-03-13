import 'mollieamount.dart';

class MollieInvoiceLineRequest {
  String period;
  String description;
  int count;
  int vatPercentage;
  MollieAmount amount;

  MollieInvoiceLineRequest({
    this.amount,
    this.count,
    this.description,
    this.period,
    this.vatPercentage,
  });

  MollieInvoiceLineRequest.build(dynamic data) {
    period = data["period"];
    amount = MollieAmount(
      value: data["amount"]["value"],
      currency: data["amount"]["currency"],
    );
    description = data["description"];
    vatPercentage = data["vatPercentage"];
  }
}
