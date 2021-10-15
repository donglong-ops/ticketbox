// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    groupId: json['groupId'] as int?,
    groupName: json['groupName'] as String?,
    groupImageUrl: json['groupImageUrl'] as String?,
    isDeleted: json['isDeleted'] as bool?,
    createDate: json['createDate'] == null
        ? null
        : DateTime.parse(json['createDate'] as String),
    modifyDate: json['modifyDate'] == null
        ? null
        : DateTime.parse(json['modifyDate'] as String),
    // event: json['events'] == null
    //     ? null
    //     : Event.fromJson(json['events'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'groupId': instance.groupId,
      'groupName': instance.groupName,
      'groupImageUrl': instance.groupImageUrl,
      'isDeleted': instance.isDeleted,
      'createDate': instance.createDate,
      'modifyDate': instance.modifyDate,
      // 'events': instance.event,
    };
