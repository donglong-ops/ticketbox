import 'package:json_annotation/json_annotation.dart';
import 'group.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final int? eventId, groupId, approvalState;
  final DateTime? timeOccur, createDate, modifyDate;
  final String? eventName, location, imageUrl;
  final double? price;
  final Group? group;
  final bool? isDeleted, isExpired;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Event({
    this.eventId,
    this.eventName,
    this.groupId,
    this.location,
    this.approvalState,
    this.imageUrl,
    this.timeOccur,
    this.isDeleted,
    this.isExpired,
    this.createDate,
    this.modifyDate,
    this.price,
    this.group
  });

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
