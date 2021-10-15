import 'package:ticket_box/src/common/endpoints.dart';
import 'package:ticket_box/src/models/ticket.dart';
import 'package:ticket_box/src/services/api/base_service.dart';

mixin ITicketService {
  Future<List<Ticket>> getTickets();
}

class TicketService extends BaseService<Ticket> implements ITicketService {
  @override
  String endpoint() {
    return Endpoints.tickets;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Ticket.fromJson(json);
  }

  @override
  Future<List<Ticket>> getTickets() {
    return getAllBase({});
  }

}


