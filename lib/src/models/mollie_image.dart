import 'package:json_annotation/json_annotation.dart';

part 'mollie_image.g.dart';

@JsonSerializable()
class MollieImage {
  String? size1x;
  String? size2x;
  String? svg;

  MollieImage({this.size1x, this.size2x, this.svg});

  factory MollieImage.fromJson(Map<String, dynamic> json) => _$MollieImageFromJson(json);

  Map<String, dynamic> toJson() => _$MollieImageToJson(this);

  MollieImage copyWith({
    String? size1x,
    String? size2x,
    String? svg,
  }) {
    return MollieImage(
      size1x: size1x ?? this.size1x,
      size2x: size2x ?? this.size2x,
      svg: svg ?? this.svg,
    );
  }
}
