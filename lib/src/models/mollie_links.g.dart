// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mollie_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MollieLinks _$MollieLinksFromJson(Map<String, dynamic> json) => MollieLinks(
      self: json['self'] == null
          ? null
          : MollieSelf.fromJson(json['self'] as Map<String, dynamic>),
      checkout: json['checkout'] == null
          ? null
          : MollieCheckout.fromJson(json['checkout'] as Map<String, dynamic>),
      dashboard: json['dashboard'] == null
          ? null
          : MollieDashboard.fromJson(json['dashboard'] as Map<String, dynamic>),
      documentation: json['documentation'] == null
          ? null
          : MollieDocumentation.fromJson(
              json['documentation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MollieLinksToJson(MollieLinks instance) =>
    <String, dynamic>{
      'self': instance.self,
      'checkout': instance.checkout,
      'dashboard': instance.dashboard,
      'documentation': instance.documentation,
    };
