import 'package:json_annotation/json_annotation.dart';
import 'package:mollie/src/models/mollie_amount.dart';

part 'mollie_application_fee.g.dart';

@JsonSerializable()
class MollieApplicationFee {
  String? description;
  MollieAmount? amount;

  MollieApplicationFee({this.description, this.amount});

  factory MollieApplicationFee.fromJson(Map<String, dynamic> json) {
    return _$MollieApplicationFeeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MollieApplicationFeeToJson(this);

  MollieApplicationFee copyWith({
    String? description,
    MollieAmount? amount,
  }) {
    return MollieApplicationFee(
      description: description ?? this.description,
      amount: amount ?? this.amount,
    );
  }
}
