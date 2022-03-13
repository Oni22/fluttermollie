import 'package:json_annotation/json_annotation.dart';

part 'mollie_documentation.g.dart';

@JsonSerializable()
class MollieDocumentation {
  String? href;
  String? type;

  MollieDocumentation({this.href, this.type});

  factory MollieDocumentation.fromJson(Map<String, dynamic> json) {
    return _$MollieDocumentationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MollieDocumentationToJson(this);

  MollieDocumentation copyWith({
    String? href,
    String? type,
  }) {
    return MollieDocumentation(
      href: href ?? this.href,
      type: type ?? this.type,
    );
  }
}
