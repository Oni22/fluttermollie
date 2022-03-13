// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mollie_issuer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MollieIssuer _$MollieIssuerFromJson(Map<String, dynamic> json) => MollieIssuer(
      resource: json['resource'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : MollieImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MollieIssuerToJson(MollieIssuer instance) => <String, dynamic>{
      'resource': instance.resource,
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
