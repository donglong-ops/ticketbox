import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ticket_box/src/models/account.dart';

import 'booking.dart';
import 'account.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket {
  final int? eventId, bookingId;
  final DateTime? createDate, modifyDate;
  final String? ticketId;
  final bool? isExpired;
  final Booking? booking;
  final Account? user;


  factory Ticket.fromJson(Map<String, dynamic> json) =>
      _$TicketFromJson(json);

  Ticket({
    this.eventId,
    this.bookingId,
    this.createDate,
    this.modifyDate,
    this.isExpired,
    this.ticketId,
    this.user,
    this.booking
  });

  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
