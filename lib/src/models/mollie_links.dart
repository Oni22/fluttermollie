import 'package:json_annotation/json_annotation.dart';

import 'mollie_checkout.dart';
import 'mollie_dashboard.dart';
import 'mollie_documentation.dart';
import 'mollie_self.dart';

part 'mollie_links.g.dart';

@JsonSerializable()
class MollieLinks {
  MollieSelf? self;
  MollieCheckout? checkout;
  MollieDashboard? dashboard;
  MollieDocumentation? documentation;

  MollieLinks({this.self, this.checkout, this.dashboard, this.documentation});

  factory MollieLinks.fromJson(Map<String, dynamic> json) =>
      _$MollieLinksFromJson(json);

  Map<String, dynamic> toJson() => _$MollieLinksToJson(this);

  MollieLinks copyWith({
    MollieSelf? self,
    MollieCheckout? checkout,
    MollieDashboard? dashboard,
    MollieDocumentation? documentation,
  }) {
    return MollieLinks(
      self: self ?? this.self,
      checkout: checkout ?? this.checkout,
      dashboard: dashboard ?? this.dashboard,
      documentation: documentation ?? this.documentation,
    );
  }
}
