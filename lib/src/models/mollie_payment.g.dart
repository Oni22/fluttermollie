// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mollie_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MolliePayment _$MolliePaymentFromJson(Map<String, dynamic> json) =>
    MolliePayment(
      amount: json['amount'] == null
          ? null
          : MollieAmount.fromJson(json['amount'] as Map<String, dynamic>),
      description: json['description'] as String?,
      webhookUrl: json['webhookUrl'] as String?,
      redirectUrl: json['redirectUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      method: json['method'] as String?,
      locale: json['locale'] as String?,
      restrictPaymentMethodsToCountry:
          json['restrictPaymentMethodsToCountry'] as String?,
      sequenceType: json['sequenceType'] as String?,
      customerId: json['customerId'] as String?,
      mandateId: json['mandateId'] as String?,
      billingAddress: json['billingAddress'] == null
          ? null
          : MollieAddress.fromJson(
              json['billingAddress'] as Map<String, dynamic>),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : MollieAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
    )
      ..cardToken = json['cardToken'] as String?
      ..profileId = json['profileId'] as String?
      ..testmode = json['testmode'] as bool?;

Map<String, dynamic> _$MolliePaymentToJson(MolliePayment instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'description': instance.description,
      'webhookUrl': instance.webhookUrl,
      'redirectUrl': instance.redirectUrl,
      'metadata': instance.metadata,
      'method': instance.method,
      'locale': instance.locale,
      'restrictPaymentMethodsToCountry':
          instance.restrictPaymentMethodsToCountry,
      'sequenceType': instance.sequenceType,
      'customerId': instance.customerId,
      'mandateId': instance.mandateId,
      'billingAddress': instance.billingAddress,
      'cardToken': instance.cardToken,
      'shippingAddress': instance.shippingAddress,
      'profileId': instance.profileId,
      'testmode': instance.testmode,
    };
