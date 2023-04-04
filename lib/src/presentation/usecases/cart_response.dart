import 'package:json_annotation/json_annotation.dart';

part "cart_response.g.dart";

@JsonSerializable()
class CartResponse {
  final int quantity;
  final Map<dynamic, dynamic> paint;
  final String id;
  final String name;
  final String price;
  final bool deliveryFree;
  final String coverImage;
  final String description;

  CartResponse({
    required this.name,
    required this.paint,
    required this.coverImage,
    required this.deliveryFree,
    required this.description,
    required this.id,
    required this.price,
    required this.quantity,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
