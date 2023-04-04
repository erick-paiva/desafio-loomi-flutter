import 'package:json_annotation/json_annotation.dart';

part "signup_response.g.dart";

@JsonSerializable()
class SignupResponse {
  final String name;
  final String email;
  final String password;
  final String id;

  SignupResponse({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
