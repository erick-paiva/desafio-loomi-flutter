import 'package:json_annotation/json_annotation.dart';

part "profile_response.g.dart";

@JsonSerializable()
class ProfileResponse {
  final String name;
  final String email;
  final String avatar;

  ProfileResponse({
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
