import 'package:json_annotation/json_annotation.dart';

part 'mollie_amount.g.dart';

@JsonSerializable()
class MollieAmount {
  String? currency;
  String? value;

  MollieAmount({this.currency, this.value});

  factory MollieAmount.fromJson(Map<String, dynamic> json) {
    return _$MollieAmountFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MollieAmountToJson(this);

  MollieAmount copyWith({
    String? currency,
    String? value,
  }) {
    return MollieAmount(
      currency: currency ?? this.currency,
      value: value ?? this.value,
    );
  }
}
