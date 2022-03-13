// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mollie_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MollieAmount _$MollieAmountFromJson(Map<String, dynamic> json) => MollieAmount(
      currency: json['currency'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$MollieAmountToJson(MollieAmount instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'value': instance.value,
    };
