// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mollie_payment_method_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MolliePaymentMethodResponse _$MolliePaymentMethodResponseFromJson(
        Map<String, dynamic> json) =>
    MolliePaymentMethodResponse(
      resource: json['resource'] as String?,
      id: json['id'] as String?,
      description: json['description'] as String?,
      minimumAmount: json['minimumAmount'] == null
          ? null
          : MollieAmount.fromJson(
              json['minimumAmount'] as Map<String, dynamic>),
      maximumAmount: json['maximumAmount'] == null
          ? null
          : MollieAmount.fromJson(
              json['maximumAmount'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : MollieImage.fromJson(json['image'] as Map<String, dynamic>),
      issuers: (json['issuers'] as List<dynamic>?)
          ?.map((e) => Issuer.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      pricing: (json['pricing'] as List<dynamic>?)
          ?.map((e) => Pricing.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['_links'] == null
          ? null
          : MollieLinks.fromJson(json['_links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MolliePaymentMethodResponseToJson(
        MolliePaymentMethodResponse instance) =>
    <String, dynamic>{
      'resource': instance.resource,
      'id': instance.id,
      'description': instance.description,
      'minimumAmount': instance.minimumAmount,
      'maximumAmount': instance.maximumAmount,
      'image': instance.image,
      'issuers': instance.issuers,
      'status': instance.status,
      'pricing': instance.pricing,
      '_links': instance.links,
    };
