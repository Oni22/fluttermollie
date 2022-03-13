// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mollie_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MolliePaymentResponse _$MolliePaymentResponseFromJson(
        Map<String, dynamic> json) =>
    MolliePaymentResponse(
      resource: json['resource'] as String?,
      id: json['id'] as String?,
      mode: json['mode'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      amount: json['amount'] == null
          ? null
          : MollieAmount.fromJson(json['amount'] as Map<String, dynamic>),
      description: json['description'] as String?,
      method: json['method'],
      metadata: json['metadata'] as Map<String, dynamic>?,
      status: json['status'] as String?,
      isCancelable: json['isCancelable'] as bool?,
      locale: json['locale'] as String?,
      restrictPaymentMethodsToCountry:
          json['restrictPaymentMethodsToCountry'] as String?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      details: json['details'],
      profileId: json['profileId'] as String?,
      sequenceType: json['sequenceType'] as String?,
      redirectUrl: json['redirectUrl'] as String?,
      webhookUrl: json['webhookUrl'] as String?,
      links: json['_links'] == null
          ? null
          : MollieLinks.fromJson(json['_links'] as Map<String, dynamic>),
      amountCaptured: json['amountCaptured'] == null
          ? null
          : MollieAmount.fromJson(
              json['amountCaptured'] as Map<String, dynamic>),
      amountChargedBack: json['amountChargedBack'] == null
          ? null
          : MollieAmount.fromJson(
              json['amountChargedBack'] as Map<String, dynamic>),
      amountRefunded: json['amountRefunded'] == null
          ? null
          : MollieAmount.fromJson(
              json['amountRefunded'] as Map<String, dynamic>),
      amountRemaining: json['amountRemaining'] == null
          ? null
          : MollieAmount.fromJson(
              json['amountRemaining'] as Map<String, dynamic>),
      applicationFee: json['applicationFee'] == null
          ? null
          : MollieApplicationFee.fromJson(
              json['applicationFee'] as Map<String, dynamic>),
      authorizedAt: json['authorizedAt'] == null
          ? null
          : DateTime.parse(json['authorizedAt'] as String),
      canceledAt: json['canceledAt'] == null
          ? null
          : DateTime.parse(json['canceledAt'] as String),
      expiredAt: json['expiredAt'] == null
          ? null
          : DateTime.parse(json['expiredAt'] as String),
      failedAt: json['failedAt'] == null
          ? null
          : DateTime.parse(json['failedAt'] as String),
      orderId: json['orderId'] as String?,
      settlementAmount: json['settlementAmount'] == null
          ? null
          : MollieAmount.fromJson(
              json['settlementAmount'] as Map<String, dynamic>),
      settlementId: json['settlementId'] as String?,
    );

Map<String, dynamic> _$MolliePaymentResponseToJson(
        MolliePaymentResponse instance) =>
    <String, dynamic>{
      'resource': instance.resource,
      'id': instance.id,
      'mode': instance.mode,
      'createdAt': instance.createdAt?.toIso8601String(),
      'amount': instance.amount,
      'description': instance.description,
      'method': instance.method,
      'metadata': instance.metadata,
      'status': instance.status,
      'isCancelable': instance.isCancelable,
      'authorizedAt': instance.authorizedAt?.toIso8601String(),
      'canceledAt': instance.canceledAt?.toIso8601String(),
      'expiredAt': instance.expiredAt?.toIso8601String(),
      'failedAt': instance.failedAt?.toIso8601String(),
      'amountRefunded': instance.amountRefunded,
      'amountRemaining': instance.amountRemaining,
      'amountCaptured': instance.amountCaptured,
      'amountChargedBack': instance.amountChargedBack,
      'settlementAmount': instance.settlementAmount,
      'locale': instance.locale,
      'restrictPaymentMethodsToCountry':
          instance.restrictPaymentMethodsToCountry,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'details': instance.details,
      'profileId': instance.profileId,
      'settlementId': instance.settlementId,
      'orderId': instance.orderId,
      'sequenceType': instance.sequenceType,
      'redirectUrl': instance.redirectUrl,
      'webhookUrl': instance.webhookUrl,
      '_links': instance.links,
      'applicationFee': instance.applicationFee,
    };
