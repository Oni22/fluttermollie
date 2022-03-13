import 'package:json_annotation/json_annotation.dart';
import 'package:mollie/src/models/mollie_amount.dart';
import 'package:mollie/src/models/mollie_application_fee.dart';

import 'mollie_links.dart';

part 'mollie_payment_response.g.dart';

@JsonSerializable()
class MolliePaymentResponse {
  String? resource;
  String? id;
  String? mode;
  DateTime? createdAt;
  MollieAmount? amount;
  String? description;
  dynamic method;
  Map<String, dynamic>? metadata;
  String? status;
  bool? isCancelable;
  DateTime? authorizedAt;
  DateTime? canceledAt;
  DateTime? expiredAt;
  DateTime? failedAt;
  MollieAmount? amountRefunded;
  MollieAmount? amountRemaining;
  MollieAmount? amountCaptured;
  MollieAmount? amountChargedBack;
  MollieAmount? settlementAmount;
  String? locale;
  String? restrictPaymentMethodsToCountry;
  DateTime? expiresAt;
  dynamic details;
  String? profileId;
  String? settlementId;
  String? orderId;
  String? sequenceType;
  String? redirectUrl;
  String? webhookUrl;
  @JsonKey(name: '_links')
  MollieLinks? links;
  MollieApplicationFee? applicationFee;

  MolliePaymentResponse({
    this.resource,
    this.id,
    this.mode,
    this.createdAt,
    this.amount,
    this.description,
    this.method,
    this.metadata,
    this.status,
    this.isCancelable,
    this.locale,
    this.restrictPaymentMethodsToCountry,
    this.expiresAt,
    this.details,
    this.profileId,
    this.sequenceType,
    this.redirectUrl,
    this.webhookUrl,
    this.links,
    this.amountCaptured,
    this.amountChargedBack,
    this.amountRefunded,
    this.amountRemaining,
    this.applicationFee,
    this.authorizedAt,
    this.canceledAt,
    this.expiredAt,
    this.failedAt,
    this.orderId,
    this.settlementAmount,
    this.settlementId,
  });

  factory MolliePaymentResponse.fromJson(Map<String, dynamic> json) {
    return _$MolliePaymentResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MolliePaymentResponseToJson(this);

  MolliePaymentResponse copyWith({
    String? resource,
    String? id,
    String? mode,
    DateTime? createdAt,
    MollieAmount? amount,
    String? description,
    dynamic method,
    Map<String, dynamic>? metadata,
    String? status,
    bool? isCancelable,
    String? locale,
    String? restrictPaymentMethodsToCountry,
    DateTime? expiresAt,
    dynamic details,
    String? profileId,
    String? sequenceType,
    String? redirectUrl,
    String? webhookUrl,
    MollieLinks? links,
  }) {
    return MolliePaymentResponse(
      resource: resource ?? this.resource,
      id: id ?? this.id,
      mode: mode ?? this.mode,
      createdAt: createdAt ?? this.createdAt,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      method: method ?? this.method,
      metadata: metadata ?? this.metadata,
      status: status ?? this.status,
      isCancelable: isCancelable ?? this.isCancelable,
      locale: locale ?? this.locale,
      restrictPaymentMethodsToCountry: restrictPaymentMethodsToCountry ??
          this.restrictPaymentMethodsToCountry,
      expiresAt: expiresAt ?? this.expiresAt,
      details: details ?? this.details,
      profileId: profileId ?? this.profileId,
      sequenceType: sequenceType ?? this.sequenceType,
      redirectUrl: redirectUrl ?? this.redirectUrl,
      webhookUrl: webhookUrl ?? this.webhookUrl,
      links: links ?? this.links,
    );
  }
}
