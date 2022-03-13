import 'package:json_annotation/json_annotation.dart';
import 'package:mollie/src/models/mollie_amount.dart';
import 'package:mollie/src/models/mollie_links.dart';

import 'mollie_image.dart';
import 'issuer.dart';
import 'pricing.dart';

part 'mollie_payment_method_response.g.dart';

@JsonSerializable()
class MolliePaymentMethodResponse {
  String? resource;
  String? id;
  String? description;
  MollieAmount? minimumAmount;
  MollieAmount? maximumAmount;
  MollieImage? image;
  List<Issuer>? issuers;
  String? status;
  List<Pricing>? pricing;
  @JsonKey(name: '_links')
  MollieLinks? links;

  MolliePaymentMethodResponse({
    this.resource,
    this.id,
    this.description,
    this.minimumAmount,
    this.maximumAmount,
    this.image,
    this.issuers,
    this.status,
    this.pricing,
    this.links,
  });

  factory MolliePaymentMethodResponse.fromJson(Map<String, dynamic> json) {
    return _$MolliePaymentMethodResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MolliePaymentMethodResponseToJson(this);

  MolliePaymentMethodResponse copyWith({
    String? resource,
    String? id,
    String? description,
    MollieAmount? minimumAmount,
    MollieAmount? maximumAmount,
    MollieImage? image,
    List<Issuer>? issuers,
    String? status,
    List<Pricing>? pricing,
    MollieLinks? links,
  }) {
    return MolliePaymentMethodResponse(
      resource: resource ?? this.resource,
      id: id ?? this.id,
      description: description ?? this.description,
      minimumAmount: minimumAmount ?? this.minimumAmount,
      maximumAmount: maximumAmount ?? this.maximumAmount,
      image: image ?? this.image,
      issuers: issuers ?? this.issuers,
      status: status ?? this.status,
      pricing: pricing ?? this.pricing,
      links: links ?? this.links,
    );
  }
}
