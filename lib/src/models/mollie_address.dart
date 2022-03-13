import 'package:json_annotation/json_annotation.dart';

part 'mollie_address.g.dart';

@JsonSerializable()
class MollieAddress {
  String? region;
  String? streetAndNumber;
  String? streetAdditional;
  String? postalCode;
  String? city;
  String? country;

  MollieAddress({
    this.region,
    this.streetAndNumber,
    this.streetAdditional,
    this.postalCode,
    this.city,
    this.country,
  });

  factory MollieAddress.fromJson(Map<String, dynamic> json) {
    return _$MollieAddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MollieAddressToJson(this);

  MollieAddress copyWith({
    String? region,
    String? streetAndNumber,
    String? streetAdditional,
    String? postalCode,
    String? city,
    String? country,
  }) {
    return MollieAddress(
      region: region ?? this.region,
      streetAndNumber: streetAndNumber ?? this.streetAndNumber,
      streetAdditional: streetAdditional ?? this.streetAdditional,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }
}
