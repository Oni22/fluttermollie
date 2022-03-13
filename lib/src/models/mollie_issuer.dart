import 'package:json_annotation/json_annotation.dart';

import 'mollie_image.dart';

part 'mollie_issuer.g.dart';

@JsonSerializable()
class MollieIssuer {
  String? resource;
  String? id;
  String? name;
  MollieImage? image;

  MollieIssuer({this.resource, this.id, this.name, this.image});

  factory MollieIssuer.fromJson(Map<String, dynamic> json) {
    return _$MollieIssuerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MollieIssuerToJson(this);

  MollieIssuer copyWith({
    String? resource,
    String? id,
    String? name,
    MollieImage? image,
  }) {
    return MollieIssuer(
      resource: resource ?? this.resource,
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
