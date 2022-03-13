// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pricing _$PricingFromJson(Map<String, dynamic> json) => Pricing(
      description: json['description'] as String?,
      fixed: json['fixed'] == null
          ? null
          : MollieAmount.fromJson(json['fixed'] as Map<String, dynamic>),
      variable: json['variable'] as String?,
    );

Map<String, dynamic> _$PricingToJson(Pricing instance) => <String, dynamic>{
      'description': instance.description,
      'fixed': instance.fixed,
      'variable': instance.variable,
    };
