// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return PaymentMethod(
    paymentId: json['paymentId'] as int?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) => <String, dynamic>{
      'paymentId': instance.paymentId,
      'description': instance.description,
    };
