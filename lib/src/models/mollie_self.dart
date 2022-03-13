import 'package:json_annotation/json_annotation.dart';

part 'mollie_self.g.dart';

@JsonSerializable()
class MollieSelf {
  String? href;
  String? type;

  MollieSelf({this.href, this.type});

  factory MollieSelf.fromJson(Map<String, dynamic> json) =>
      _$MollieSelfFromJson(json);

  Map<String, dynamic> toJson() => _$MollieSelfToJson(this);

  MollieSelf copyWith({
    String? href,
    String? type,
  }) {
    return MollieSelf(
      href: href ?? this.href,
      type: type ?? this.type,
    );
  }
}
