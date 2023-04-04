import 'package:json_annotation/json_annotation.dart';

part "paint.g.dart";

@JsonSerializable()
class Paint {
  Paint();

  factory Paint.fromJson(Map<String, dynamic> json) => _$PaintFromJson(json);

  Map<String, dynamic> toJson() => _$PaintToJson(this);
}
