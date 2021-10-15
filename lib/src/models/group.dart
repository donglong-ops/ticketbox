import 'package:json_annotation/json_annotation.dart';
import 'package:ticket_box/src/models/event.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  final int? groupId;
  final DateTime? createDate, modifyDate;
  final String? groupName, groupImageUrl;
  final bool? isDeleted;
  // final Event? event;

  factory Group.fromJson(Map<String, dynamic> json) =>
      _$GroupFromJson(json);

  Group({
    this.groupId,
    this.createDate,
    this.modifyDate,
    this.groupName,
    this.groupImageUrl,
    this.isDeleted,
    // this.event
  });

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
