import 'package:json_annotation/json_annotation.dart';

part "cart_model.g.dart";

@JsonSerializable()
class CartModel {
  final String name;
  final String price;
  final bool deliveryFree;
  final String coverImage;
  final String description;
  final String id;

  CartModel(
      {required this.price,
      required this.deliveryFree,
      required this.name,
      required this.coverImage,
      required this.description,
      required this.id});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
