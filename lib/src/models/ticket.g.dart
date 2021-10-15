// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return Ticket(
    eventId: json['eventId'] as int?,
    ticketId: json['ticketId'] as String?,
    bookingId: json['bookingId'] as int?,
    isExpired: json['isExpired'] as bool?,
    createDate: json['createDate'] == null
        ? null
        : DateTime.parse(json['createDate'] as String),
    modifyDate: json['modifyDate'] == null
        ? null
        : DateTime.parse(json['modifyDate'] as String),
    booking: json['booking'] == null
        ? null
        : Booking.fromJson(json['booking'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : Account.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'ticketId': instance.ticketId,
      'eventId': instance.eventId,
      'bookingId': instance.bookingId,
      'isExpired': instance.isExpired,
      'createDate': instance.createDate,
      'modifyDate': instance.modifyDate,
      'booking': instance.booking,
      'user': instance.user,
    };
