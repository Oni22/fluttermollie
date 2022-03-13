import 'package:json_annotation/json_annotation.dart';
import 'package:mollie/src/models/mollie_amount.dart';

part 'mollie_pricing.g.dart';

@JsonSerializable()
class MolliePricing {
  String? description;
  MollieAmount? fixed;
  String? variable;

  MolliePricing({this.description, this.fixed, this.variable});

  factory MolliePricing.fromJson(Map<String, dynamic> json) {
    return _$PricingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PricingToJson(this);

  MolliePricing copyWith({
    String? description,
    MollieAmount? fixed,
    String? variable,
  }) {
    return MolliePricing(
      description: description ?? this.description,
      fixed: fixed ?? this.fixed,
      variable: variable ?? this.variable,
    );
  }
}
