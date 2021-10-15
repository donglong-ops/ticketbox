import 'package:json_annotation/json_annotation.dart';

part 'payment_method.g.dart';

@JsonSerializable()
class PaymentMethod {
  final int? paymentId;
  final String? description;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  PaymentMethod({
    this.paymentId,
    this.description,
  });

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
