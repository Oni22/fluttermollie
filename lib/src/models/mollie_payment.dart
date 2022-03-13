import 'package:json_annotation/json_annotation.dart';
import 'package:mollie/src/models/mollie_address.dart';

import 'mollie_amount.dart';

part 'mollie_payment.g.dart';

@JsonSerializable()
class MolliePayment {
  MollieAmount? amount;
  String? description;
  String? webhookUrl;
  String? redirectUrl;
  Map<String, dynamic>? metadata;
  String? method;
  String? locale;
  String? restrictPaymentMethodsToCountry;
  String? sequenceType;
  String? customerId;
  String? mandateId;
  MollieAddress? billingAddress;
  String? cardToken;
  MollieAddress? shippingAddress;
  String? profileId;
  bool? testmode;

  MolliePayment({
    this.amount,
    this.description,
    this.webhookUrl,
    this.redirectUrl,
    this.metadata,
    this.method,
    this.locale,
    this.restrictPaymentMethodsToCountry,
    this.sequenceType,
    this.customerId,
    this.mandateId,
    this.billingAddress,
    this.shippingAddress,
  });

  factory MolliePayment.fromJson(Map<String, dynamic> json) {
    return _$MolliePaymentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MolliePaymentToJson(this);

  MolliePayment copyWith({
    MollieAmount? amount,
    String? description,
    String? webhookUrl,
    String? redirectUrl,
    Map<String, dynamic>? metadata,
  }) {
    return MolliePayment(
      amount: amount ?? this.amount,
      description: description ?? this.description,
      webhookUrl: webhookUrl ?? this.webhookUrl,
      redirectUrl: redirectUrl ?? this.redirectUrl,
      metadata: metadata ?? this.metadata,
    );
  }
}
