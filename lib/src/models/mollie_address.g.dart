// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mollie_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MollieAddress _$MollieAddressFromJson(Map<String, dynamic> json) =>
    MollieAddress(
      region: json['region'] as String?,
      streetAndNumber: json['streetAndNumber'] as String?,
      streetAdditional: json['streetAdditional'] as String?,
      postalCode: json['postalCode'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$MollieAddressToJson(MollieAddress instance) =>
    <String, dynamic>{
      'region': instance.region,
      'streetAndNumber': instance.streetAndNumber,
      'streetAdditional': instance.streetAdditional,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'country': instance.country,
    };
