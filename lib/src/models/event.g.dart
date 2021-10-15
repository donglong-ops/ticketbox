// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    eventId: json['eventId'] as int?,
    eventName: json['eventName'] as String?,
    location: json['location'] as String?,
    groupId: json['groupId'] as int?,
    approvalState: json['approvalState'] as int?,
    imageUrl: json['imageUrl'] as String?,
    isDeleted: json['isDeleted'] as bool?,
    timeOccur: json['timeOccur'] == null
        ? null
        : DateTime.parse(json['timeOccur'] as String),
    isExpired: json['isExpired'] as bool?,
    createDate: json['createDate'] == null
        ? null
        : DateTime.parse(json['createDate'] as String),
    modifyDate: json['modifyDate'] == null
        ? null
        : DateTime.parse(json['modifyDate'] as String),
    price: (json['price'] as num?)?.toDouble(),
    group: json['group'] == null
        ? null
        : Group.fromJson(json['group'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'eventName': instance.eventName,
      'groupId': instance.groupId,
      'location': instance.location,
      'approvalState': instance.approvalState,
      'imageUrl': instance.imageUrl,
      'isDeleted': instance.isDeleted,
      'timeOccur': instance.timeOccur,
      'isExpired': instance.isExpired,
      'createDate': instance.createDate,
      'modifyDate': instance.modifyDate,
      'price': instance.price,
      'group': instance.group,
    };
