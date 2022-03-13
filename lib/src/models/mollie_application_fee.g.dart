// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mollie_application_fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MollieApplicationFee _$MollieApplicationFeeFromJson(
        Map<String, dynamic> json) =>
    MollieApplicationFee(
      description: json['description'] as String?,
      amount: json['amount'] == null
          ? null
          : MollieAmount.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MollieApplicationFeeToJson(
        MollieApplicationFee instance) =>
    <String, dynamic>{
      'description': instance.description,
      'amount': instance.amount,
    };
