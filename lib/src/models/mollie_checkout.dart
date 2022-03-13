import 'package:json_annotation/json_annotation.dart';

part 'mollie_checkout.g.dart';

@JsonSerializable()
class MollieCheckout {
  String? href;
  String? type;

  MollieCheckout({this.href, this.type});

  factory MollieCheckout.fromJson(Map<String, dynamic> json) {
    return _$MollieCheckoutFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MollieCheckoutToJson(this);

  MollieCheckout copyWith({
    String? href,
    String? type,
  }) {
    return MollieCheckout(
      href: href ?? this.href,
      type: type ?? this.type,
    );
  }
}
