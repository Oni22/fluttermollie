
import 'package:mollie/src/mollieinvoiceline.dart';
import 'mollieamount.dart';

class MollieInvoiceRequest {
  String id;
  MollieInvoiceRequest({this.id});
}

class MollieInvoiceResponse {

  String resource;
  String id;
  String reference;
  String vatNumber;
  String status;
  String issuedAt;
  String paidAt;
  String dueAt;
  MollieAmount netAmount;
  MollieAmount vatAmount;
  MollieAmount grossAmount;
  List<MollieInvoiceLineRequest> lines = [];
  String linksSelf;
  String linksPdf;
  String pdfExpiresAt;

  MollieInvoiceResponse.build(dynamic data) {
    resource = data["resource"];
    id = data["id"];
    reference = data["reference"];
    vatNumber = data["vatNumber"];
    status = data["status"];
    issuedAt = data["issuedAt"];
    paidAt = data["paidAt"];
    dueAt = data["dueAt"];
    netAmount = MollieAmount(
      value: data["netAmount"]["value"],
      currency: data["netAmount"]["currency"]
    );
    vatAmount = MollieAmount(
      value: data["vatAmount"]["value"],
      currency: data["vatAmount"]["currency"]
    );
    grossAmount = MollieAmount(
      value: data["grossAmount"]["value"],
      currency: data["grossAmount"]["currency"]
    );

    for(int i = 0; i < data["lines"].lenght; i++){
      var node = data["lines"][i];
      lines.add(MollieInvoiceLineRequest.build(node));
    }

    linksSelf = data["_links"]["self"]["href"];
    linksPdf = data["_links"]["pdf"]["href"];
    pdfExpiresAt = data["_links"]["pdf"]["expiresAt"];

  }

}