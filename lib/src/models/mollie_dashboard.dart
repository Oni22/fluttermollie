import 'package:json_annotation/json_annotation.dart';

part 'mollie_dashboard.g.dart';

@JsonSerializable()
class MollieDashboard {
  String? href;
  String? type;

  MollieDashboard({this.href, this.type});

  factory MollieDashboard.fromJson(Map<String, dynamic> json) {
    return _$MollieDashboardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MollieDashboardToJson(this);

  MollieDashboard copyWith({
    String? href,
    String? type,
  }) {
    return MollieDashboard(
      href: href ?? this.href,
      type: type ?? this.type,
    );
  }
}
