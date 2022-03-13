class MollieDetails {
  final String bankName;
  final String bankAccount;
  final String bankBic;
  final String transferReference;
  final String consumerName;
  final String consumerAccount;
  final String consumerBic;
  final String billingEmail;

  MollieDetails({
    this.bankName,
    this.bankAccount,
    this.bankBic,
    this.transferReference,
    this.consumerName,
    this.consumerAccount,
    this.consumerBic,
    this.billingEmail,
  });

  factory MollieDetails.fromMap(Map<String, dynamic> map) => MollieDetails(
        bankName: map["bankName"],
        bankAccount: map["bankAccount"],
        bankBic: map["bankBic"],
        transferReference: map["transferReference"],
        consumerName: map["consumerName"],
        consumerAccount: map["consumerAccount"],
        consumerBic: map["consumerBic"],
        billingEmail: map["billingEmail"],
      );
}
